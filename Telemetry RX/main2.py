import sys
import serial
from io import StringIO
import csv
from openpyxl import Workbook
import datetime
from dateutil.parser import parse

from PyQt5.QtCore import QCoreApplication, Qt, QUrl
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot, QThread



class Dash(QObject):

    def __init__(self):
        QObject.__init__(self)
        
    #create the signals that change the GUI     
    auxVoltage = pyqtSignal(float, arguments=['auxvolt'])
    
    





        
class ThreadClass(QThread):
    # Create the signal
    auxVoltage = pyqtSignal(float, arguments=['auxvolt'])


    

    def __init__(self, parent=None):
        super(ThreadClass, self).__init__(parent)     
        
        self.auxVoltage.connect(dashboard.auxVoltage)

        


    def run(self):
        value=7
        
        while True:
            if value < 17:
                value=+.1
            else:
                value=-.1
            
            # Emit the signals
            self.auxVoltage.emit(value)

            
        pass       





def main():
    # Create an instance of the application
    app = QGuiApplication(sys.argv)
    # Create QML engine
    engine = QQmlApplicationEngine()
    # create a dashboard object
    dashboard = Dash()
    # register it in the context of QML
    engine.rootContext().setContextProperty("dashboard", dashboard)
    #load qml file into engine
    engine.load(QUrl('main1.qml'))


    
    threadclass=ThreadClass()
    threadclass.start()

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())
    app.exec_()

if __name__ == '__main__':
    main()