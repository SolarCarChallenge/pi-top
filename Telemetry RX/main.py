import sys
import serial
from io import StringIO
import csv
from openpyxl import Workbook
import datetime
from dateutil.parser import parse
import time

from PyQt5.QtCore import QCoreApplication, Qt, QUrl
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot, QThread

# Create an instance of the application
app = QGuiApplication(sys.argv)
# Create QML engine
engine = QQmlApplicationEngine()

class Dash(QObject):

    def __init__(self):
        QObject.__init__(self)
        
    #create the signals that change the GUI     
    auxVoltage = pyqtSignal(float, arguments=['auxvolt'])
    mainVoltage = pyqtSignal(float, arguments=['mainvolt'])
    mainCurrent = pyqtSignal(float, arguments=['maincur'])
    carSpeed = pyqtSignal(float, arguments=['speedmph'])
    ampHour = pyqtSignal(float, arguments=['amphr'])
    
    

# create a dashboard object
dashboard = Dash()



        
class ThreadClass(QThread):
    # Create the signal
    auxVoltage = pyqtSignal(float, arguments=['auxvolt'])
    mainVoltage = pyqtSignal(float, arguments=['mainvolt'])
    mainCurrent = pyqtSignal(float, arguments=['maincur'])
    carSpeed = pyqtSignal(float, arguments=['speedmph'])
    ampHour = pyqtSignal(float, arguments=['amphr'])


    

    def __init__(self, parent=None):
        super(ThreadClass, self).__init__(parent)     
        
        self.auxVoltage.connect(dashboard.auxVoltage)
        self.mainVoltage.connect(dashboard.mainVoltage)
        self.mainCurrent.connect(dashboard.mainCurrent)
        self.carSpeed.connect(dashboard.carSpeed)
        self.ampHour.connect(dashboard.ampHour)

        


    def run(self):
        auxvalue=7.0
        auxcountup=True
        mainvalue=38
        maincountup=True
        currentvalue=-50
        currentcountup=True
        speedvalue=0
        speedcountup=True
        amphourvalue=0
        amphourcountup=True
        
        while True:
            if auxcountup:
                auxvalue+=.1
            else:
                auxvalue-=.1
            
            if auxvalue > 17:
                auxcountup = False
            if auxvalue < 7:
                auxcountup = True
                
            if maincountup:
                mainvalue+=.2
            else:
                mainvalue-=.2
            
            if mainvalue > 58:
                maincountup = False
            if mainvalue < 38:
                maincountup = True
                
            if currentcountup:
                currentvalue+=1
            else:
                currentvalue-=1
            
            if currentvalue > 50:
                currentcountup = False
            if currentvalue < -50:
                currentcountup = True
                
            if speedcountup:
               speedvalue+=.6
            else:
                speedvalue-=.6
            
            if speedvalue > 60:
                speedcountup = False
            if speedvalue < 0:
                speedcountup = True
                
            if amphourcountup:
               amphourvalue+=1
            else:
                amphourvalue-=1
            
            if amphourvalue > 99:
                amphourcountup = False
            if amphourvalue < 0:
                amphourcountup = True
                
                
                
                
                
                
                
            
            auxvalue=round(auxvalue,2)
            mainvalue=round(mainvalue,2)
            currentvalue=round(currentvalue,2)
            speedvalue=round(speedvalue,2)
            amphourvalue=round(amphourvalue,2)
 
            # Emit the signals
            self.auxVoltage.emit(auxvalue)
            self.mainVoltage.emit(mainvalue)
            self.mainCurrent.emit(currentvalue)
            self.carSpeed.emit(speedvalue)
            self.ampHour.emit(amphourvalue)
            
            
            
            time.sleep(.5)

            
        pass       








    # register it in the context of QML
    engine.rootContext().setContextProperty("dashboard", dashboard)
    #load qml file into engine
    engine.load(QUrl('main2.qml'))


    
threadclass=ThreadClass()
threadclass.start()

engine.quit.connect(app.quit)
sys.exit(app.exec_())
app.exec_()
