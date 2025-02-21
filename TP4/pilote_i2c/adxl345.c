#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/of.h>
#include <linux/i2c.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/kfifo.h>
#include <linux/interrupt.h>

char number_of_device = 0;

static irqreturn_t adxl345_irq(int irq, void *dev_id);

#define ADXL345_REG_DEVID 0x00
#define ADXL345_REG_BW_RATE 0x2C
#define ADXL345_REG_POWER_CTL 0x2D
#define ADXL345_REG_INT_ENABLE 0x2E
#define ADXL345_REG_DATA_FORMAT 0x31
#define ADXL345_REG_DATA_X0 0x32
#define ADXL345_REG_DATA_X1 0x33
#define ADXL345_REG_DATA_Y0 0x34
#define ADXL345_REG_DATA_Y1 0x35
#define ADXL345_REG_DATA_Z0 0x36
#define ADXL345_REG_DATA_Z1 0x37
#define ADXL345_REG_FIFO_CTL 0x38
#define ADXL345_REG_FIFO_STATUS 0x39

#define IOCTL_SET_AXIS_X _IO('a', 1)
#define IOCTL_SET_AXIS_Y _IO('a', 2)
#define IOCTL_SET_AXIS_Z _IO('a', 3)

struct fifo_element {
    char data[6];
};

struct adxl345_device {
    DECLARE_KFIFO(samples_fifo, struct fifo_element, 32);
    struct miscdevice misc_dev;
    int axis;
};

irqreturn_t adxl345_irq(int irq, void *dev_id){
    struct fifo_element fifo;
    int samples_cnt;
    struct adxl345_device *adxl345_dev;
    struct i2c_client *client;
    char buffer[6];
    int bytes_read;
    int i;
    char reg_fifo_status;
    char reg_data_x0;

    adxl345_dev = (struct adxl345_device *)dev_id;
    client = (struct i2c_client *)to_i2c_client(adxl345_dev->misc_dev.parent);

    reg_fifo_status = ADXL345_REG_FIFO_STATUS;
    reg_data_x0 = ADXL345_REG_DATA_X0;

    samples_cnt = i2c_master_send(client, &reg_fifo_status, 1) & 0x3F;

    for (i = 0; i < samples_cnt; i++) {
        bytes_read = 0;
        i2c_master_send(client, &reg_data_x0, 1);
        while (bytes_read < 6)
            bytes_read += i2c_master_recv(client, buffer + bytes_read, 6 - bytes_read);
        memcpy(fifo.data, buffer, 6);
        kfifo_put(&adxl345_dev->samples_fifo, fifo);
    }

    return IRQ_HANDLED;
}

static int read_register_i2c(struct i2c_client *client, char reg_address, char *value) {
    char buffer[1];
    int error = 0;
    buffer[0] = reg_address;
    error = i2c_master_send(client, buffer, 1);

    if (error < 0) {
        pr_info("[ERROR] reading register (send) %x\n", reg_address);
        return error;
    }

    error = i2c_master_recv(client, value, 1);

    if (error < 0) {
        pr_info("[ERROR] reading register (receive) %x\n", reg_address);
        return error;
    }
    return 0;
}

static int write_register_i2c(struct i2c_client *client, char reg_address, char value) {
    char buffer[2];
    int error;
    buffer[0] = reg_address;
    buffer[1] = value;
    error = i2c_master_send(client, buffer, 2);

    if (error < 0) {
        pr_info("[ERROR] writing register %x\n", reg_address);
        return error;
    }

    return 0;
}

static ssize_t adxl345_read(struct file *file, char __user *buf, size_t count, loff_t *ppos) {
    struct adxl345_device *adxl345_dev;
    struct i2c_client *client;
    // pr_info("Read function call\n");
    adxl345_dev = container_of(file->private_data, struct adxl345_device, misc_dev);
    client = container_of(adxl345_dev->misc_dev.parent, struct i2c_client, dev);

    struct fifo_element fifo;

    if (kfifo_get(&adxl345_dev->samples_fifo, &fifo)) {
        // char *buffer = fifo.data;
        // pr_info("Result = X%hd Y%hd Z%hd\n\n", (short)(buffer[0] + (buffer[1] << 8)),(short)(buffer[2] + (buffer[3] << 8)), (short)(buffer[4] + (buffer[5] << 8)));

        if (copy_to_user(buf, &fifo.data, sizeof(fifo.data))) {
            pr_info("[ERROR] copy_to_user\n");
            return -EFAULT;
        }
        return sizeof(fifo.data);
    } else {
        pr_info("The FIFO is empty :( \n");
        return 0;
    }
}

static int adxl345_open(struct inode *inode, struct file *file) {
    struct adxl345_device *adxl345_dev = container_of(file->private_data, struct adxl345_device, misc_dev);
    adxl345_dev->axis = 1; // Default to X-axis
    return 0;
}

static long adxl345_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    struct adxl345_device *adxl345_dev = container_of(file->private_data, struct adxl345_device, misc_dev);

    switch (cmd) {
        case IOCTL_SET_AXIS_X:
            adxl345_dev->axis = 1;
            break;
        case IOCTL_SET_AXIS_Y:
            adxl345_dev->axis = 2;
            break;
        case IOCTL_SET_AXIS_Z:
            adxl345_dev->axis = 3;
            break;
        default:
            pr_info("[ERROR] Invalid IOCTL command\n");
            return -EINVAL;
    }

    return 0;
}

static const struct file_operations adxl345_fops = {
    .owner = THIS_MODULE,
    .open = adxl345_open,
    .read = adxl345_read,
    .unlocked_ioctl = adxl345_ioctl,
};

static int adxl345_probe(struct i2c_client *client){
    char reg_id;
    int error = 0;
    struct adxl345_device *adxl345_dev;
    char *name;
    pr_info("ADXL345 is connect\n");

    error = read_register_i2c(client, ADXL345_REG_DEVID, &reg_id);
    if (error) {
        pr_info("[ERROR] Failed to read DEVID register\n");
        return error;
    }

    pr_info("ADXL345 DEVID: %X\n", reg_id);

    write_register_i2c(client, ADXL345_REG_BW_RATE, 0x0A);
    write_register_i2c(client, ADXL345_REG_INT_ENABLE, (1 << 1));
    write_register_i2c(client, ADXL345_REG_DATA_FORMAT, 0x00);
    write_register_i2c(client, ADXL345_REG_FIFO_CTL, (1 << 7) + 20); // not bypass the FIFO
    write_register_i2c(client, ADXL345_REG_POWER_CTL, 0x08);

    adxl345_dev = kmalloc(sizeof(struct adxl345_device), GFP_KERNEL);
    if (!adxl345_dev) {
        pr_info("[ERROR] kmalloc failed\n");
        return -ENOMEM;
    }

    name = kasprintf(GFP_KERNEL, "adxl345-%d", number_of_device);
    if (!name) {
        pr_info("[ERROR] kasprintf name failed\n");
        kfree(adxl345_dev);
        return -ENOMEM;
    }
    number_of_device++;

    pr_info("device name : %s\n", name);

    adxl345_dev->misc_dev.minor = MISC_DYNAMIC_MINOR;
    adxl345_dev->misc_dev.name = name;
    adxl345_dev->misc_dev.parent = &client->dev;
    adxl345_dev->misc_dev.fops = &adxl345_fops;
    adxl345_dev->misc_dev.this_device = NULL;
    adxl345_dev->misc_dev.groups = NULL;
    adxl345_dev->misc_dev.nodename = NULL;

    pr_info("MISC_DEV_INIT_SUCESSFUL\n");

    if (misc_register(&adxl345_dev->misc_dev)) {
        pr_info("[ERROR] misc_register failed\n");
        return -ENOMEM;
    }

    pr_info("MISC_REG_INIT_SUCESSFUL\n");

    i2c_set_clientdata(client, adxl345_dev);

    pr_info("I2C_INIT_SUCESSFUL\n");

    INIT_KFIFO(adxl345_dev->samples_fifo);

    pr_info("FIFO_INIT_SUCESSFUL\n");

    if (devm_request_threaded_irq(&client->dev, client->irq, NULL, adxl345_irq, IRQF_ONESHOT, name, adxl345_dev)) {
        dev_err(&client->dev, "Failed to request IRQ %d\n", client->irq);
        return error;
    }

    pr_info("IRQ_INIT_SUCESSFUL\n");

    return 0;
}

static void adxl345_remove(struct i2c_client *client){
    struct adxl345_device *adxl345_dev = i2c_get_clientdata(client);
    write_register_i2c(client, ADXL345_REG_POWER_CTL, 0x04);
    number_of_device--;

    misc_deregister(&adxl345_dev->misc_dev);
    kfree(adxl345_dev->misc_dev.name);
    kfree(adxl345_dev);
    pr_info("ADXL345 is disconnect\n");
    return ;
}

static struct i2c_device_id adxl345_idtable[] = {
    { "adxl345", 0x00 },
    { }
};
MODULE_DEVICE_TABLE(i2c, adxl345_idtable);

#ifdef CONFIG_OF
static const struct of_device_id adxl345_of_match[] = {
    { .compatible = "vendor,adxl345", .data = NULL },
    {}
};
MODULE_DEVICE_TABLE(of, adxl345_of_match);
#endif

static struct i2c_driver adxl345_driver = {
    .driver = {
        .name = "adxl345",
        .of_match_table = of_match_ptr(adxl345_of_match),
    },
    .probe = adxl345_probe,
    .remove = adxl345_remove,
};


module_i2c_driver(adxl345_driver);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("adxl345 driver");
MODULE_AUTHOR("Jules");
