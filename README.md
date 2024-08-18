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

Download to computer the apropiate firmware or 
