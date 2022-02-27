import QtQuick 2.0

Repeater {
    id:numbersRepeater
    model: 4
    property real originX: numbersRepeater.width/2
    property real originY: numbersRepeater.height/2
    property real radiusCircle: numbersRepeater.width/2 * 0.87
    readonly property var listName: [3,6,9,12]
    ClockNumberText {
        x:numbersRepeater.originX + numbersRepeater.radiusCircle * Math.cos(index * 2*Math.PI/4) - width/2
        y:numbersRepeater.originY + numbersRepeater.radiusCircle * Math.sin(index * 2*Math.PI/4) - height/2
        font.pointSize: numbersRepeater.width >= 100 ? numbersRepeater.width/10:8;
        text: numbersRepeater.listName[index]
    }
}
