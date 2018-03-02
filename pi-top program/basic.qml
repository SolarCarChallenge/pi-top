import QtQuick 2.0
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 200
    height: 400
    title: qsTr("Hello World")
    
    Button {
        x: 0
        y: 247
        width: 200; height:50;
        font.capitalization: Font.MixedCase
            text: qsTr("Button Name")
            objectName: "button_obj_name"
            highlighted: true
            }
        


}
