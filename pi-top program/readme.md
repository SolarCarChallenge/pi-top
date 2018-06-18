#******There was a major OS update to the pi-top since this was written.  Embarrasingly it no longer works on the pi-top.  It will still work on windows.  New version coming shortly********


# Welcome to the pi-top Reciever Application

![Logo](https://github.com/SolarCarChallenge/pi-top/blob/master/pi-top%20program/Solar%20Car%20Challenge%202_28_2018%204_22_34%20PM.png?raw=true)

## Required Modules

 For this application, you will need to add some additional modules not included with the pi-top OS.  You can load them using apt-get from the command line.  To download the modules, open the command line and type:

```
sudo apt-geg update
sudo apt-get install qt5-default pyqt5-dev pyqt5-dev-tools
sudo apt-get install python3-pyqt5
sudo apt-get install qtdeclarative5-*
sudo apt-get install qml-module-qtquick*
sudo apt-get install qtquickcontrols5-*
sudo apt-get install qml-module-qtquick2
sudo apt-get install python3-openpyxl
sudo pip3 install python-dateutil
sudo apt-get install python3-pyqt5.qtquick`
```

## Required Modules

To start the program, open terminal, change director to the folder where the program is store using the CD command, and start the program with the following command.

```
sudo python3 main.py
```

## Customization

The Graphical User Interface(GUI) is written in a QT5 and is implemented using python and the PyQT5 library.  Don't worry if that doesn't mean anything to you.  QT has a free [community edition](https://www.qt.io/download) that makes it easy to change the layout or look of the GUI. You make changes by opening and editing the QML file in QT creater.  For some reason, QT creater designer tab does not like the Connections section of the QML file.  A simple solution is to cut the Connections section out, open the designer tab, and then past the connections back into the code.  

You will probably want to customize the application to your car and voltage.  The images are stored in the /images folder.  You can modify them directly.  However, it is easier to modify the vector images that were used to produce the .png files.  These files can be found in the /vector images folder.  I used the GNU program [Inkskape](https://inkscape.org/en/) to create the guages.  Using a vector program you can easily change the text on the gauge faces, the color, or the rings.

If you need change the range of a gauge, you will need to recalibrate the gauge to your new values by modifying the QML file..  This is done in the function section of the code.  Below is an example of the sweep of the Auxillary voltage gauge.

```
    function auxangle(value)
    {
        if (value <= 7){
            return -48
        }

        if (value >= 17){
            return 229
        }
        return ((value*27.7)-241.9)
```

The first value, in this example 7, is the lowest value on the face.  It corrolates to a needle rotateion of -48 degrees.  The second value, 17 in this example is the highest value on the face.  On this gauge that corrolates to 229 degrees.  The last statement is the most important.  It is how the rotation is caluclated for any value between the high and low numbers on the gauge face.  The divisions on the gauge face are all equal.  As a result we can draw a line between the two points.  You might recognize the formula y=mx+b from math class.  Solving for the equation of the line allows us to calculate the function that returns an angle for a given value.  The excel spreedsheet "gaugecalibration.xlsx" in this folder can be used to help with the calculation.

## Hardware

This project was origionally designed around Arduino hardware sourced from Adafruit.  To copy the origional, you will need:
1. 1 x [GPS Module](https://www.adafruit.com/product/3133)
2. 2 x [Arduino LORA Feather](https://www.adafruit.com/product/3078)
3. 1 x [ADS1115 Analogue to digital converter](https://www.adafruit.com/product/1085) or [ADS1015](https://www.adafruit.com/product/1083)
4. 1 x [proto board](https://www.amazon.com/gp/product/B00LLO4Q7W/ref=oh_aui_detailpage_o00_s00?ie=UTF8&psc=1)
5. Misc wire, resisters, and capactors.

*note on suppliers.  The Solar car challenge does not endorse any particualr supllier.  I (Jarrett) buy a lot of components from Adafruit as a I have had a very low rate of DOA parts from them.  They are however one of the most expensive suppliers.  Almost identical parts can be sources from Amazon, eBay, or Aliexpress mcuh cheaper.

![breakout board](https://github.com/SolarCarChallenge/pi-top/blob/master/pi-top%20program/images/Layout2withbreadboard.png?raw=true)

Building this project from scratch is a fun and educational experiance.  However, our partnership with pi-top is allowing us to develop a custom telemetry board targeted specifically at solar cars.  This will greatly simplify integrating telemetry into you race.  This is a very exciting oppurtunity and we look forward to announcing more details shortly.

## Voltage Divider

An Arduino can only safely handle 5 volts.  This becomes a problem if you want to measure a signal that is 48 volts.  Thankfully there is a simple curcuit to safely step voltage down to a safe range for the microproccesser. 

![voltage divider](https://github.com/SolarCarChallenge/pi-top/blob/master/pi-top%20program/images/Voltagedivider.png?raw=true)
