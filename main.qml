import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import "qrc:/AnalogClockComponents" as Clock

Window {
    width: 450
    height: 450
    visible: true
    title: qsTr("Analog Clock")
    function updateCurrentTime() {
        var CurrentDateTime = new Date();
        analogClockQML.minutes = CurrentDateTime.getMinutes();
        analogClockQML.hours = CurrentDateTime.getHours();
        analogClockQML.seconds = CurrentDateTime.getSeconds();
    }
    RowLayout{
        anchors.fill: parent
        Timer{
            repeat: true
            interval: 1000
            running: true
            onTriggered: updateCurrentTime();
        }

        Clock.AnalogClock {
            id:analogClockQML
            Layout.fillHeight: true
            Layout.fillWidth: true
            Component.onCompleted: updateCurrentTime();
        }
    }
}
