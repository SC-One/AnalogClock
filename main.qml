import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import "qrc:/AnalogClockComponents" as Clock

Window {
    width: 450
    height: 450
    visible: true
    title: qsTr("Analog Clock")
    RowLayout{
        anchors.fill: parent
        Clock.AnalogClock {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
