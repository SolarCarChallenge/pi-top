import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.2


ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 1271
    height: 800
    color: "#000000"
    title: qsTr("Solar Car Challenge")

      Item{
      property var aCapacity: 200
      }


    Dialog {
        id:amphourwindow
        visible: false
        title: "Set AmpHours"



        onAccepted: console.log("Hello")

        contentItem: Rectangle {
            width: 300;
            height: 200
            Text {
                y:30
                font.pointSize: 15
                text: "Enter AmpHours"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            TextField {
                y: 60
                id:enterfield
                placeholderText: qsTr("Enter name")
                anchors.horizontalCenter: parent.horizontalCenter

                onAccepted:dashboard.set(enterfield.text)
            }

            Button {
                id: yesplease
                y:90
                width: 100
                height: 30
                text: qsTr("Set AmpHours")
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: dashboard.set(enterfield.text)

            }

        }
    }









    Image {
        id: logo
        x: 586
        y: -12
        width: 808
        height: 161
        anchors.horizontalCenterOffset: 0
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        source: "images/Logo.png"
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
        source: "images/background.png"
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
        source: "images/background.png"
    }


    Image {
        id: background3
        x: 642
        y: -51
        width: 725
        height: 624
        anchors.horizontalCenterOffset: 285
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -157
        anchors.verticalCenter: parent.verticalCenter
        z: 0
        source: "images/background.png"
    }


    Image {
        id: backgound4
        x: 642
        y: 196
        width: 725
        height: 624
        anchors.horizontalCenterOffset: 285
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 124
        anchors.verticalCenter: parent.verticalCenter
        z: 0
        source: "images/background.png"
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
        source: "images/Speedometer.png"
        Image {
            id: speedneedle
            width: 350
            height: 350
            z: 2
            anchors.verticalCenterOffset: -1
            anchors.horizontalCenterOffset: 1
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            rotation: -38
            fillMode: Image.PreserveAspectFit
            source: "images/largeneedle.png"

            Behavior on rotation { SmoothedAnimation { velocity: 100 } }
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
        source: "images/CurreentGuage.png"

        Image {
            id: currentneede
            x: 125
            y: 125
            width: 350
            height: 350
            z: 2
            rotation: -39
            anchors.verticalCenterOffset: -1
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "images/largeneedle.png"

            Behavior on rotation { SmoothedAnimation { velocity: 100 } }
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
        anchors.horizontalCenterOffset: 294
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -157
        anchors.verticalCenter: parent.verticalCenter
        source: "images/AuxBatteryGuage.png"

        Image {
            id: auxneedle
            x: 0
            y: 0
            width: 225
            height: 225
            z: 2
            rotation: -48
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "images/newnwwdle.png"

            Behavior on rotation { SmoothedAnimation { velocity: 25 } }
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
        anchors.horizontalCenterOffset: 285
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 124
        anchors.verticalCenter: parent.verticalCenter
        source: "images/MainBatteryGuage.png"

        Image {
            id: mainneedle
            x: 75
            y: 75
            width: 225
            height: 225
            rotation: -48
            z: 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "images/newnwwdle.png"

             Behavior on rotation { SmoothedAnimation { velocity: 25 } }
        }

        Text {
            id: maintext
            x: 101
            y: 153
            color: "#ffffff"
            text: qsTr("0")
            anchors.verticalCenterOffset: 49
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 26
        }

    }




    Button {
        id: startbtn
        x: 210
        y: 652
        width: 134
        height: 56
        text: qsTr("Start")
    }







    Image {
        id: amphour
        x: 1087
        y: 149
        width: 112
        height: 396
        anchors.verticalCenterOffset: -95
        anchors.horizontalCenterOffset: 521
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        source: "images/battery_low.png"

        Text {
            id: amphourvalue
            x: 45
            y: 314
            color: "#ffffff"
            text: qsTr("0")
            anchors.horizontalCenterOffset: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 28
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 45
        }

        Text {
            id: text2
            x: 46
            y: 382
            color: "#ffffff"
            text: qsTr("AmpHour")
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
        }

        Button {
            id: setamphr
            x: -17
            y: 434
            width: 134
            height: 56
            text: qsTr("Set AmpHours")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -94
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: amphourwindow.open()

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
        return ((value*2.59)+90)

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
    function amphourpicture(value)
    {

        if (value <= .25*aCapacity){
            return "images/battery_low.png"
        }
        else if (value <=.50*aCapacity){
            return "images/battery_low1.png"
        }
        else if (value <.75*aCapacity){
            return "images/battery_med.png"
        }
        else {
            return "images/battery_full.png"
        }

    }


    Image {
        id: challenglogo
        x: 452
        y: 615
        width: 307
        height: 139
        anchors.verticalCenterOffset: 280
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source: "images/Challengelogo.png"
    }

    Connections {
        target: dashboard
        ignoreUnknownSignals: true

        onAuxVoltage: {
            auxtext.text = auxvolt
            auxneedle.rotation=auxangle(auxvolt)
        }
        onMainVoltage: {
            maintext.text = mainvolt
            mainneedle.rotation=mainangle(mainvolt)
        }
        onMainCurrent: {
            currenttext.text = maincur
            currentneede.rotation=currentangle(maincur)
        }
        onCarSpeed: {
            speedtext.text = speedmph
            speedneedle.rotation=speedangle(speedmph)
        }
        onAmpHour: {
            amphourvalue.text=amphr
            amphour.source=amphourpicture(amphr)
        }

    }


}
