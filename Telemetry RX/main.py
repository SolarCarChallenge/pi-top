import sys

from PyQt5.QtCore import QCoreApplication, Qt, QUrl
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot, QThread
from pip._vendor.distlib._backport.tarfile import TOREAD

global torunornot

class Dash(QObject):
    def __init__(self):
        QObject.__init__(self)




def main():
    QCoreApplication.setAttribute(Qt.AA_EnableHighDpiScaling)
    global app
    app = QGuiApplication(sys.argv)
    
    dashboard = Dash()

    
    
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("dashboard", dashboard)
    engine.load(QUrl('main.qml'))
    if not engine.rootObjects():
        return -1

    app.exec_()

if __name__ == '__main__':
    main()