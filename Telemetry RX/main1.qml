import QtQuick 2.0
import QtQuick.Controls 1.0




ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 1271
    height: 800
    color: "#000000"
    title: qsTr("Solar Car Challenge")







    Image {
        id: logo
        x: 586
        y: -12
        width: 808
        height: 161
        anchors.horizontalCenterOffset: 0
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        source: "Logo.png"
    }
    Image {
        id: background1
        x: -212
        y: 4
        width: 936
        height: 791
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: -351
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        z: 0
        source: "background.png"
    }
    Image {
        id: background2
        x: 232
        y: 32
        width: 817
        height: 735
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        z: 0
        source: "background.png"
    }
    Image {
        id: background3
        x: 642
        y: -51
        width: 725
        height: 624
        anchors.horizontalCenterOffset: 369
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -157
        anchors.verticalCenter: parent.verticalCenter
        z: 0
        source: "background.png"
    }
    Image {
        id: backgound4
        x: 642
        y: 196
        width: 725
        height: 624
        anchors.horizontalCenterOffset: 369
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 129
        anchors.verticalCenter: parent.verticalCenter
        z: 0
        source: "background.png"
    }

     Image {
          id: speedimage
          width: 456
          height: 350
          anchors.verticalCenterOffset: 0
          anchors.horizontalCenterOffset: -359
          anchors.verticalCenter: parent.verticalCenter
          anchors.horizontalCenter: parent.horizontalCenter
          fillMode: Image.PreserveAspectFit
          source: "Speedometer.png"
          Image {
             id: speedneedle
             width: 350
             height: 350
             z: 2
             anchors.verticalCenterOffset: -1
             anchors.horizontalCenterOffset: 1
             anchors.verticalCenter: parent.verticalCenter
             anchors.horizontalCenter: parent.horizontalCenter
             rotation: 0
             fillMode: Image.PreserveAspectFit
             source: "largeneedle.png"
            }

         Text {
            id: speedtext
            x: 164
            y: 258
            width: 45
            height: 40
            color: "#ffffff"
            text: qsTr("0")
            renderType: Text.NativeRendering
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenterOffset: 75
            anchors.horizontalCenterOffset: 1
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 40
             }
                
         }

    Image {
        id: currentimage
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: 350
        height: 350
        source: "CurreentGuage.png"

        Image {
            id: currentneede
            x: 125
            y: 125
            width: 350
            height: 350
            z: 2
            rotation: 0
            anchors.verticalCenterOffset: -1
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "largeneedle.png"
            }

         Text {
           id: currenttext
           x: 164
           y: 245
           color: "#ffffff"
           text: qsTr("0")
           anchors.verticalCenterOffset: 75
           anchors.horizontalCenterOffset: 1
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.verticalCenter: parent.verticalCenter
           font.pixelSize: 40
            }
    }

    Image {
        id: image3
        x: 879
        y: 136
        width: 250
        height: 250
        anchors.horizontalCenterOffset: 368
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -157
        anchors.verticalCenter: parent.verticalCenter
        source: "AuxBatteryGuage.png"

        Image {
            id: auxneedle
            x: 0
            y: 0
            width: 225
            height: 225
            z: 2
            rotation: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "newnwwdle.png"
            }

        Text {
            id: auxtext
            x: 101
            y: 163
            color: "#ffffff"
            text: qsTr("0")
            anchors.verticalCenterOffset: 54
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 27
            }
        
    }

    Image {
        id: mainbattery
        x: 879
        y: 383
        width: 250
        height: 250
        anchors.horizontalCenterOffset: 368
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 108
        anchors.verticalCenter: parent.verticalCenter
        source: "MainBatteryGuage.png"

        Image {
            id: mainneedle
            x: 75
            y: 75
            width: 225
            height: 225
            z: 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "newnwwdle.png"
            }

         Text {
            id: maintext
            x: 101
            y: 153
            color: "#ffffff"
            text: qsTr("0")
            anchors.verticalCenterOffset: 38
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 26
            }
        
    }


    Button {
        id: startbtn
        x: 275
        y: 627
        width: 134
        height: 56
        text: qsTr("Start")
    }

    Button {
        id: swwepbtn
        x: 116
        y: 627
        width: 134
        height: 56
        text: qsTr("Sweep")
    }

Connections {
        target: dashboard
        ignoreUnknownSignals: true

        onAuxVoltage: {
        // auxvolt was set through arguments=['auxvolt']
            auxtext.text = auxvolt
            auxneedle.rotation=auxangle(auxvolt)            
            }
        onMainVoltage: {
        //through arguments=['mainvolt']
            maintext.text = mainvolt
            mainneedle.rotation=mainangle(mainvolt)            
            }
        onMainCurrent: {
        //through arguments=['maincur']
            currenttext.text = maincur
            currentneede.rotation=currentangle(maincur)
            }
        onCarSpeed: {
        // through arguments=['speedmph']
            speedtext.text = speedmph
            speedneedle.rotation=speedangle(speedmph)
            }
    }


function auxangle(value)
{
    if (value <= 7){
    return -48
    }
    
    if (value >= 17){
    return 229
    }
    return ((value*27.7)-241.9)
        
}
function mainangle(value)
{
    if (value <= 38){
    return -48
    }
    
    if (value >= 58){
    return 229
    }
    return ((value*13.85)-574.3)
        
}
function currentangle(value)
{
    if (value <= -50){
    return -39
    }
    
    if (value >= 50){
    return 219
    }
    return ((value*2.77)+90)
        
}
function speedangle(value)
{
    if (value <= 0){
    return -39
    }
    
    if (value >= 60){
    return 219
    }
    return ((value*4.35)-39)
        
}

}
