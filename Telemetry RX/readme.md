# Welcome to the pi-top Reciever Application

 ## Required Modules

 For this application, you will need to add some additional modules not included with the pi-top OS.  You can load them using apt-get from the command line.  To download the modules, open the command line and type:

```
sudo apt-get install python3-pyqt5
sudo apt-get install qtdeclarative5-*
sudo apt-get install qml-module-qtquick*
sudo apt-get install qtquick1-*
sudo apt-get install qtquickcontrols5-*
sudo apt-get install qml-module-qtquick2
```

## Customization

You will probably want to customize the application to your car and voltage.  The images are stored in the /images folder.  You can modify them directly.  However, it is easier to modify the vector images that were used to produce the .png files.  These files can be found in the /vector images folder.  I used the GNU program [Inkskape](https://inkscape.org/en/) to create the guages.  Using a vector program you can easily change the text on the gauge faces, the color, or the rings.

If you change the value of the gauge, you will need to recalibrate the gauge to your new values.  This is done in the function section of the code.  Below is an example of the sweep of the Auxillary voltage gauge.

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
