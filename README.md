# How use board makerbase mks dlc32 with micropython for custom application

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

# 2-Activate webrepl

 Open https://www.serialterminal.com/ or another terminal (at 115200 bauds), and connect over usb with esp32 ... and write "import webrepl_setup" and put password costycnc for easy reminder

 ![](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/webrepl.jpg)

# 3-Set esp32 as AP mode (access point) 

Insert line by line in terminal and send...

    import network
    import webrepl
    ap = network.WLAN(network.AP_IF)
    ap.active(True)
    ap.config(essid="costycnc", password="costycnc")
    webrepl.start()

    
 ![](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/webrepl1.jpg)

 # 4-Download WEBREPL HTML 

 Download https://github.com/micropython/webrepl  in your computer and open webrepl.html

  ![](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/webrepl3.jpg)

 
 # 5-Connect with AP "costycnc" psw "costycnc"

  ![](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/webrepl2.jpg)

 # 6-Connect with WEBREPL 

 Insert adress ws://192.168.4.1:8266 and when ask for psw insert costycnc ... now you are conected over wifi !!!

  ![](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/webrepl4.jpg)


  # 7-Now you can upload files to or download files from root

  For example you can download and modify the boot.py
  
    ![](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/webrepl5.jpg)
    
  you can insert in boot.py 

    import network
    ap = network.WLAN(network.AP_IF)
    ap.active(True)
    ap.config(essid="costycnc", password="costycnc")

to activate AP when boot    


 


