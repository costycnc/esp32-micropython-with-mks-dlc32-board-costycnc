# How use board makerbase mks dlc32 with micropython for custom application

 ![](https://github.com/costycnc/esp32-micropython-with-mks-dlc32-board-costycnc/blob/main/foto/mks.jpg)

 # What is Makerbase MKS DLC32 ?

 On official github page https://github.com/makerbase-mks/MKS-DLC32 did:

      MKS DLC32 motherboard kit, which is an offline engraving master control kit developed for desktop engraving machines.
      The hardware is equipped with a 32-bit high-speed ESP32 module, integrated WIFI function,
      and directly drives a 3.5-inch touch color screen; 
      it can realize fast engraving and WEB web pages. 
      Control, mobile phone APP control and other functions.
     The mounting holes and board size of MKS DLC32 are compatible with MKS DLC, 
     and the it can also be used with the LaserGRBL and LightBurn PC software.

 Also here https://github.com/makerbase-mks/MKS-DLC32 you find all firmware compatible with mks dlc32.

 # What want this project

 In this project explain how install micropython on mks dlc32 and use custom commands to control the board.

 Certainly , is very difficult to create with micropython a program like original ,i can did impossible , but with micropython you can learn base of programming 
and open curiosity about how working a firmware or how command steppers motors ,ecc!!!

 # Some useful links and informations

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

    Download to computer the apropiate micropython firmware or (for windows) download ESP32_GENERIC-20240602-v1.23.0.bin,esptool.exe and test.bat ... insert usb cable 
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


 


