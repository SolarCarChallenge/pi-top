import QtQuick 2.0
import QtQuick.Controls 2.2
import Qt.labs.platform 1.0
import QtQuick.Controls.Universal 2.0
import QtQuick.Extras 1.4

ApplicationWindow {
    visible: true
    width: 1271
    height: 647
    color: "#000000"
    title: qsTr("Hello World")

    Image {
        id: image
        x: 15
        y: 10
        width: 1241
        height: 637
        fillMode: Image.PreserveAspectFit
        sourceSize.height: 0
        source: "Guagebackground.png"

        Button {
            id: button1
            x: 979
            y: 105
            text: qsTr("Start")
            onClicked: {dashboard.startstop()}

        }
            


        Image {
            id: auxneedle
            x: 11
            y: 272
            width: 343
            height: 195
            antialiasing: true
            rotation: 0
            fillMode: Image.PreserveAspectFit
            source: "newnwwdle.png"
        }

        Image {
            id: mainneedle
            x: 887
            y: 262
            width: 343
            height: 224
            antialiasing: true
            source: "newnwwdle.png"
            fillMode: Image.PreserveAspectFit
            rotation: 0
        }

        Image {
            id: currentneedle
            x: 377
            y: 324
            width: 480
            height: 100
            antialiasing: true
            rotation: 90
            fillMode: Image.PreserveAspectFit
            source: "largeneedle.png"

            Text {
                id: text1
                x: 362
                y: 38
                text: qsTr("Text")
                font.pixelSize: 12
            }
        }




        
    }
    Connections {
        target: dashboard
        ignoreUnknownSignals: true
        




    }



}
