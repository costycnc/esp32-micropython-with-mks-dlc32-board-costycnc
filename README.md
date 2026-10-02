# MicroPython on the MKS-DLC32: Turn an ESP32 CNC Controller into a Programmable Board

![MKS-DLC32](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/mks.jpg)

## What is this project?

This project shows how to install **MicroPython on the ESP32 of an MKS-DLC32** and use the board for custom experiments and applications.

The MKS-DLC32 is normally used as a CNC/laser controller. It contains an ESP32, Wi-Fi and hardware for controlling CNC/laser machines.

Instead of using the original CNC firmware, this project explores another possibility:

> **Use the ESP32 inside the MKS-DLC32 as a programmable MicroPython controller.**

This is mainly an **educational and experimental project**. It does not try to reproduce the original MKS-DLC32 firmware with MicroPython.

With MicroPython you can learn how the ESP32 works, communicate with it over USB and Wi-Fi, run Python programs, access the board hardware and experiment with motor/control applications.

---

## What can you learn from this project?

The project demonstrates how to:

- install MicroPython on an ESP32-based MKS-DLC32;
- erase the existing firmware and flash MicroPython;
- communicate with the ESP32 through a serial terminal;
- activate **WebREPL**;
- configure the ESP32 as a Wi-Fi Access Point;
- connect to the ESP32 from a computer over Wi-Fi;
- use a browser to access MicroPython through WebREPL;
- upload and download Python files;
- modify boot.py;
- automatically start a Wi-Fi Access Point after boot;
- investigate the MKS-DLC32 pins and hardware;
- experiment with custom Python applications.

The original project was created because it is interesting to go below the normal CNC firmware level and see what can be done with the ESP32 itself.

---

## Important warning

**Flashing MicroPython erases the existing firmware from the ESP32.**

This project is an experiment. Before flashing the board, make sure you understand how to restore the original MKS-DLC32 firmware if you want to return to normal CNC operation.

Do not assume that a MicroPython program is a replacement for the original MKS-DLC32 firmware.

---

# 1. What is the MKS-DLC32?

According to the Makerbase project, the MKS-DLC32 is a controller based on a 32-bit ESP32 module with integrated Wi-Fi, intended for desktop engraving/CNC applications.

The board can be used with CNC/laser software and firmware from the MKS-DLC32 ecosystem.

Official MKS-DLC32 repository:

https://github.com/makerbase-mks/MKS-DLC32

The important point for this project is that **there is an ESP32 inside the board**.

That makes the MKS-DLC32 interesting not only as a CNC controller, but also as a hardware platform for ESP32 experiments.

---

# 2. Install MicroPython on the ESP32

For the original Windows procedure, this repository contains:

- a MicroPython .bin firmware file;
- esptool.exe;
- test.bat.

The original example uses:

    ESP32_GENERIC-20240602-v1.23.0.bin

and the batch file performs erase_flash followed by the MicroPython firmware upload.

Open test.bat with a text editor and change COM3 to the serial port used by your MKS-DLC32.

Example:

    esptool.exe --chip esp32 --port com3 erase_flash
    esptool.exe --chip esp32 --port com3 --baud 460800 write_flash -z 0x1000 ESP32_GENERIC-OTA-20240602-v1.23.0.bin
    pause

Connect the board by USB and execute the batch file.

### Alternative

MicroPython can also be installed using:

https://esp.huhn.me/

The exact firmware file and flashing procedure may change with newer MicroPython releases. The files in this repository document the original working setup.

---

# 3. Activate WebREPL

After MicroPython is installed, connect to the ESP32 through USB using a serial terminal.

The original project used:

https://www.serialterminal.com/

Set the terminal to **115200 baud**.

Enter:

    import webrepl_setup

Follow the prompts and set a WebREPL password.

The original project used:

    costycnc

for easy testing.

![WebREPL setup](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/webrepl.jpg)

---

# 4. Start the ESP32 as a Wi-Fi Access Point

Enter the following commands line by line:

    import network
    import webrepl

    ap = network.WLAN(network.AP_IF)
    ap.active(True)
    ap.config(essid="costycnc", password="costycnc")

    webrepl.start()

This creates a Wi-Fi Access Point named:

    costycnc

with password:

    costycnc

![WebREPL setup](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/webrepl1.jpg)

---

# 5. Open WebREPL

The MicroPython WebREPL client can be obtained from:

https://github.com/micropython/webrepl

Download the repository and open webrepl.html.

![WebREPL](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/webrepl3.jpg)

---

# 6. Connect the computer to the MKS-DLC32

Connect your computer to the Wi-Fi network:

    costycnc

using the password:

    costycnc

![Connect to AP](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/webrepl2.jpg)

Then open WebREPL and connect to:

    ws://192.168.4.1:8266

Enter the WebREPL password.

![WebREPL connection](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/webrepl4.jpg)

At this point the ESP32 can be accessed over Wi-Fi.

---

# 7. Upload and run Python files

WebREPL allows files to be uploaded to and downloaded from the ESP32.

For example, you can download boot.py, modify it and upload it again.

![WebREPL file access](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/webrepl5.jpg)

boot.py is executed during boot, so it can be used to configure the ESP32 automatically.

For example:

    import network

    ap = network.WLAN(network.AP_IF)
    ap.active(True)
    ap.config(essid="costycnc", password="costycnc")

With this code, the Access Point can be activated automatically after boot.

The original project also used:

    exec(open("test.py").read())

to execute a Python file from the ESP32.

---

# 8. MKS-DLC32 pins and hardware

For the original investigation of the MKS-DLC32 hardware, the project used the MKS firmware machine definition:

https://github.com/makerbase-mks/MKS-DLC32-FIRMWARE/blob/main/Firmware/Grbl_Esp32/src/Machines/3axis_v4.h

This is useful when investigating which ESP32 pins are connected to the MKS-DLC32 hardware.

**Always verify the actual board revision and schematic/pin definition before connecting external hardware.**

---

# 9. MKS-DLC32 Wi-Fi commands

This repository also contains Commands.txt.

It documents commands used by the MKS-DLC32/ESP3D firmware for Wi-Fi and other functions.

For example, when Wi-Fi is disabled, the original project used:

    $ESP115=ON

The board can then report information such as:

    [MSG:Local access point ESPWIFI_47276 started, 192.168.4.1]
    [MSG:HTTP Started]
    [MSG:TELNET Started 8080]

For a normal home Wi-Fi network, the original notes show commands such as:

    $ESP100=xxxxxx
    $ESP101=xxxxxx
    $ESP110=STA
    $ESP115=ON

The complete command reference is preserved in Commands.txt.

It includes commands related to:

- STA and AP Wi-Fi configuration;
- IP configuration;
- hostname;
- HTTP;
- Telnet;
- Bluetooth;
- SD card;
- SPIFFS;
- EEPROM settings;
- available Wi-Fi networks;
- restart;
- firmware information.

Some commands require authentication depending on the firmware configuration.

---

# 10. Useful MicroPython resources

### MicroPython ESP32 introduction

https://docs.micropython.org/en/latest/esp32/tutorial/intro.html

### MicroPython ESP32 quick reference

https://docs.micropython.org/en/latest/esp32/quickref.html

### MicroPython WebREPL

https://github.com/micropython/webrepl

### MicroPython WebREPL website

https://micropython.org/webrepl/

### Serial terminal used in the original experiment

https://www.serialterminal.com/

---

# Why use MicroPython on an MKS-DLC32?

The interesting question is not only:

**"How do I run MicroPython on an ESP32?"**

A more interesting question is:

**"What can I do with an MKS-DLC32 when I use the ESP32 directly instead of its normal CNC firmware?"**

The original experiment was motivated by curiosity about what happens inside a CNC controller:

- How does the ESP32 communicate?
- How can software control hardware?
- How can a Python program communicate with the board?
- How can Wi-Fi be added to a custom application?
- How can the board's hardware be accessed?
- What would be required to create a custom controller?

MicroPython makes these questions easier to explore because the programming environment is much simpler than writing a complete replacement for the original firmware.

---

# Project scope

This repository is **not** intended to be:

- a replacement for GRBL/Grbl_ESP32;
- a complete CNC firmware;
- an industrial CNC controller;
- a production-ready MicroPython CNC system.

It is an **experimental and educational project** showing how the ESP32 inside an MKS-DLC32 can be used independently with MicroPython.

The original files and notes are intentionally preserved because they show the actual steps used during the experiment.

---

# CostyCNC

This project is by **CostyCNC**.

The idea behind the project is simple:

> Take hardware that already exists, understand what is inside it, and see what else can be done with it.

The MKS-DLC32 is normally presented as a CNC/laser controller. Here it becomes an ESP32 development platform for experimentation with MicroPython, Wi-Fi, hardware access and custom applications.
