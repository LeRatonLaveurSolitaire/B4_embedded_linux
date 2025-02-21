#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>

#define FILE_NAME "/dev/adxl345-0"
#define AXIS_X 1
#define AXIS_Y 2
#define AXIS_Z 3

#define IOCTL_SET_AXIS_X _IO('a', 1)
#define IOCTL_SET_AXIS_Y _IO('a', 2)
#define IOCTL_SET_AXIS_Z _IO('a', 3)

int main()
{
    // Request the axis to read
    char axis;
    int selected_axis;

    printf("Choose an axis (x, y, z): ");
    scanf("%c", &axis);

    if (axis == 'x' || axis == 'X')
        selected_axis = IOCTL_SET_AXIS_X;
    else if (axis == 'y' || axis == 'Y')
        selected_axis = IOCTL_SET_AXIS_Y;
    else if (axis == 'z' || axis == 'Z')
        selected_axis = IOCTL_SET_AXIS_Z;
    else
    {
        printf("Failed to read an invalid axis\n");
        return -1;
    }

    // Request the number of samples to read
    unsigned int samples;
    printf("Number of samples: ");
    scanf("%u", &samples);

    int file = open(FILE_NAME, O_RDONLY);
    if (file < 0)
    {
        printf("[ERROR] Error opening file\n");
        return 1;
    }

    // Set the axis using ioctl
    if (ioctl(file, selected_axis) < 0)
    {
        printf("[ERROR] Failed to set axis\n");
        close(file);
        return -1;
    }

    // Create a buffer to hold the samples
    short buffer[samples];
    ssize_t bytes_read;

    for (unsigned int i = 0; i < samples; i++)
    {
        printf("Sample %u\n", i+1);
        // Read from the device
        bytes_read = read(file, &buffer[i], sizeof(long));
        if (bytes_read < 0)
        {
            printf("[ERROR] Failed to read from the device\n");
            close(file);
            return -1;
        }

        printf("Result = %hd\n\n", buffer[i]);

        usleep(100000); // Sleep for 100 milliseconds
    }

    // Close the device file
    close(file);

    return 0;
}
