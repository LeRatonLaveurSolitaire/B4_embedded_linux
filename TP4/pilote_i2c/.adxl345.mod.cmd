savedcmd_adxl345.mod := printf '%s\n'   adxl345.o | awk '!x[$$0]++ { print("./"$$0) }' > adxl345.mod
