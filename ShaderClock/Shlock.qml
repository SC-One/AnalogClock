import QtQuick 2.12

Rectangle {
    id:root
    property real hours:0
    property real minutes:0
    property real seconds:0
    ShaderEffect
    {
        id:rootShader
        anchors.fill: parent
        property var src;
        property real iGlobalTime: 0.0
        property size u_Resolution: Qt.size(root.width,root.height)
        Timer {
            id:timer
            interval: 1; running: true; repeat: true
            onTriggered: {
                rootShader.iGlobalTime += 0.001;
            }
        }

        fragmentShader: "qrc:/ShaderClock/ClockShader.fsh"

    }
}
