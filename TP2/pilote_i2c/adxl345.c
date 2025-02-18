#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/of.h>
#include <linux/i2c.h>

#define ADXL345_REG_DEVID 0x00
#define ADXL345_REG_BW_RATE 0x2C
#define ADXL345_REG_POWER_CTL 0x2D
#define ADXL345_REG_INT_ENABLE 0x2E
#define ADXL345_REG_DATA_FORMAT 0x31
#define ADXL345_REG_FIFO_CTL 0x38

static int read_register_i2c(struct i2c_client *client, char reg_address, char *value)
{
    char buffer[1];
    int error=0;
    buffer[0] = reg_address;
    error = i2c_master_send(client, buffer, 1);

    if (error < 0){
        pr_info("Error reading register (send) %x\n", reg_address);
        return error;
    }

    error = i2c_master_recv(client, value, 1);

    if (error < 0){
        pr_info("Error reading register (receive) %x\n", reg_address);
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

    // Gestion erreur
    if (error < 0){
        pr_info("Error writing register %x\n", reg_address);
        return error;
    }

    return 0;
}

static int adxl345_probe(struct i2c_client *client)
{
    char id;
    int error=0;

    pr_info("ADXL345 is connect\n");

    error = read_register_i2c(client, ADXL345_REG_DEVID, &id);


    pr_info("ADXL345 DEVID: %x\n", id);

    write_register_i2c(client, ADXL345_REG_BW_RATE, 0x0A);
    write_register_i2c(client, ADXL345_REG_INT_ENABLE, 0x00);
    write_register_i2c(client, ADXL345_REG_DATA_FORMAT, 0x00);
    write_register_i2c(client, ADXL345_REG_FIFO_CTL, 0x00);
    write_register_i2c(client, ADXL345_REG_POWER_CTL, 0x08);

    return 0;
}

static void adxl345_remove(struct i2c_client *client)
{
    write_register_i2c(client, ADXL345_REG_POWER_CTL, 0x04);
    pr_info("ADXL345 is disconnect\n");
}

/* La liste suivante permet l'association entre un périphérique et son
   pilote dans le cas d'une initialisation statique sans utilisation de
   device tree.

   Chaque entrée contient une chaîne de caractère utilisée pour
   faire l'association et un entier qui peut être utilisé par le
   pilote pour effectuer des traitements différents en fonction
   du périphérique physique détecté (cas d'un pilote pouvant gérer
   différents modèles de périphérique).
*/
static struct i2c_device_id adxl345_idtable[] = {
    { "adxl345", 0x00 },
    { }
};
MODULE_DEVICE_TABLE(i2c, adxl345_idtable);

#ifdef CONFIG_OF
/* Si le support des device trees est disponible, la liste suivante
   permet de faire l'association à l'aide du device tree.

   Chaque entrée contient une structure de type of_device_id. Le champ
   compatible est une chaîne qui est utilisée pour faire l'association
   avec les champs compatible dans le device tree. Le champ data est
   un pointeur void* qui peut être utilisé par le pilote pour
   effectuer des traitements différents en fonction du périphérique
   physique détecté.
*/
static const struct of_device_id adxl345_of_match[] = {
    { .compatible = "vendor,adxl345",
      .data = NULL },
    {}
};

MODULE_DEVICE_TABLE(of, adxl345_of_match);
#endif

static struct i2c_driver adxl345_driver = {
    .driver = {
        /* Le champ name doit correspondre au nom du module
           et ne doit pas contenir d'espace */
        .name   = "adxl345",
        .of_match_table = of_match_ptr(adxl345_of_match),
    },

    .id_table       = adxl345_idtable,
    .probe          = adxl345_probe,
    .remove         = adxl345_remove,
};

module_i2c_driver(adxl345_driver);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("adxl345 driver");
MODULE_AUTHOR("Jules");