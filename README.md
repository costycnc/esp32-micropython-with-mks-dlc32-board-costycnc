# esp32-micropython-with-mks-dlc32-board-costycnc

https://docs.micropython.org/en/latest/esp32/tutorial/intro.html

    import network
    import webrepl
    ap = network.WLAN(network.AP_IF)
    ap.active(True)
    ap.config(essid="costycnc", password="costycnc")
    webrepl.start()

    exec(open("test.py").read())

https://micropython.org/webrepl/

        import network
        import webrepl
        ap = network.WLAN(network.AP_IF)
        ap.active(True)
        ap.config(essid="costycnc", password="costycnc")
        webrepl.start()

        exec(open("test.py").read())

        
serial terminal https://www.serialterminal.com/

webrepl source https://github.com/micropython/webrepl

# 1-Upload firmware to esp32

Download to computer the apropiate firmware or (for windows) download ESP32_GENERIC-20240602-v1.23.0.bin,esptool.exe and test.bat ... insert usb cable 

open test.bat with a text editor and change port com3 with your port

Execute test.bat and firmware will be uploaded to esp32

... Or use https://esp.huhn.me/
