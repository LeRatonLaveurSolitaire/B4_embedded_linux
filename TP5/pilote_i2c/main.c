#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <errno.h>

#define FILE_NAME "/dev/adxl345-0"

int main() {
    static volatile unsigned long long i;

    int file = open(FILE_NAME, O_RDONLY);
    if (file < 0) {
        perror("Error opening file");
        return 1;
    }

    char buffer[6];
    ssize_t bytes_read;

    for(;;){
        printf("\nSample %llu\n", ++i );
        do{
            bytes_read = read(file, buffer, sizeof(buffer));
            if (bytes_read !=0) printf("Result = X: %hd Y: %hd Z: %hd\n",(short)(buffer[0] + (buffer[1] << 8)),(short)(buffer[2] + (buffer[3] << 8)),(short)(buffer[4] + (buffer[5] << 8)));
        }while(bytes_read != 0);

        usleep(500000); 
    }

    close(file);
    return 0;
}
