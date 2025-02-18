#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/of.h>
#include <linux/i2c.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/uaccess.h>

char number_of_device = 0;

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

#define IOCTL_SET_AXIS_X _IO('a', 1)
#define IOCTL_SET_AXIS_Y _IO('a', 2)
#define IOCTL_SET_AXIS_Z _IO('a', 3)

struct adxl345_device
{
    struct miscdevice misc_dev;
    int axis;
};

static int read_register_i2c(struct i2c_client *client, char reg_address, char *value)
{
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

static int write_register_i2c(struct i2c_client *client, char reg_address, char value)
{
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

static ssize_t adxl345_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
{
    pr_info("Read function call\n");
    struct adxl345_device *adxl345_dev = container_of(file->private_data, struct adxl345_device, misc_dev);
    struct i2c_client *client = container_of(adxl345_dev->misc_dev.parent, struct i2c_client, dev);
    char data[2];
    int error = 0;

    // Read data from the accelerometer based on the selected axis
    if (adxl345_dev->axis == 1) {
        error = read_register_i2c(client, ADXL345_REG_DATA_X0, &data[0]);
        if (error) return error;
        error = read_register_i2c(client, ADXL345_REG_DATA_X1, &data[1]);
        if (error) return error;
    } else if (adxl345_dev->axis == 2) {
        error = read_register_i2c(client, ADXL345_REG_DATA_Y0, &data[0]);
        if (error) return error;
        error = read_register_i2c(client, ADXL345_REG_DATA_Y1, &data[1]);
        if (error) return error;
    } else if (adxl345_dev->axis == 3) {
        error = read_register_i2c(client, ADXL345_REG_DATA_Z0, &data[0]);
        if (error) return error;
        error = read_register_i2c(client, ADXL345_REG_DATA_Z1, &data[1]);
        if (error) return error;
    } else {
        pr_info("[ERROR] Invalid axis\n");
        return -EINVAL;
    }

    // Combine the data into a single value
    short value = (data[1] << 8) | data[0];

    // Copy the value to user space
    if (copy_to_user(buf, &value, sizeof(value))) {
        pr_info("[ERROR] copy_to_user\n");
        return -EFAULT;
    }

    return sizeof(value);
}

static int adxl345_open(struct inode *inode, struct file *file)
{
    struct adxl345_device *adxl345_dev = container_of(file->private_data, struct adxl345_device, misc_dev);
    adxl345_dev->axis = 1; // Default to X-axis
    return 0;
}

static long adxl345_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
{
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

static int adxl345_probe(struct i2c_client *client)
{
    char id;
    int error = 0;

    pr_info("ADXL345 is connect\n");

    error = read_register_i2c(client, ADXL345_REG_DEVID, &id);
    if (error) {
        pr_info("[ERROR] Failed to read DEVID register\n");
        return error;
    }

    pr_info("ADXL345 DEVID: %X\n", id);

    write_register_i2c(client, ADXL345_REG_BW_RATE, 0x0A);
    write_register_i2c(client, ADXL345_REG_INT_ENABLE, 0x00);
    write_register_i2c(client, ADXL345_REG_DATA_FORMAT, 0x00);
    write_register_i2c(client, ADXL345_REG_FIFO_CTL, 0x00);
    write_register_i2c(client, ADXL345_REG_POWER_CTL, 0x08);

    struct adxl345_device *adxl345_dev;
    adxl345_dev = kmalloc(sizeof(struct adxl345_device), GFP_KERNEL);
    if (!adxl345_dev) {
        pr_info("[ERROR] kmalloc failed\n");
        return -ENOMEM;
    }

    char *name = kasprintf(GFP_KERNEL, "adxl345-%d", number_of_device);
    if (!name) {
        pr_info("[ERROR] kasprintf name failed\n");
        kfree(adxl345_dev);
        return -ENOMEM;
    }
    number_of_device++;

    adxl345_dev->misc_dev.minor = MISC_DYNAMIC_MINOR;
    adxl345_dev->misc_dev.name = name;
    adxl345_dev->misc_dev.parent = &client->dev;
    adxl345_dev->misc_dev.fops = &adxl345_fops;

    if (misc_register(&adxl345_dev->misc_dev)) {
        pr_info("[ERROR] misc_register failed\n");
        kfree(name);
        kfree(adxl345_dev);
        return -ENOMEM;
    }

    i2c_set_clientdata(client, adxl345_dev);
    return 0;
}

static void adxl345_remove(struct i2c_client *client)
{
    struct adxl345_device *adxl345_dev = i2c_get_clientdata(client);
    write_register_i2c(client, ADXL345_REG_POWER_CTL, 0x04);
    number_of_device--;

    misc_deregister(&adxl345_dev->misc_dev);
    kfree(adxl345_dev->misc_dev.name);
    kfree(adxl345_dev);
    pr_info("ADXL345 is disconnect\n");
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
    .id_table = adxl345_idtable,
    .probe = adxl345_probe,
    .remove = adxl345_remove,
};

module_i2c_driver(adxl345_driver);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("adxl345 driver");
MODULE_AUTHOR("Jules");
