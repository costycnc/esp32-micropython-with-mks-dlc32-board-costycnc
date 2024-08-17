# esp32-micropython-with-mks-dlc32-board-costycnc

https://docs.micropython.org/en/latest/esp32/tutorial/intro.html

        import network
        import webrepl
        ap = network.WLAN(network.AP_IF)
        ap.active(True)
        ap.config(essid="costycnc", password="costycnc")
        webrepl.start()

https://micropython.org/webrepl/        
