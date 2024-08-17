esptool.exe --chip esp32 --port com3 erase_flash
esptool.exe --chip esp32 --port com3 --baud 460800 write_flash -z 0x1000 ESP32_GENERIC-OTA-20240602-v1.23.0.bin
pause