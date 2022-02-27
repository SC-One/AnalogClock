import QtQuick 2.0

Repeater {
    id:numbersRepeater
    property real originX: numbersRepeater.width/2
    property real originY: numbersRepeater.height/2
    property real radiusCircle: numbersRepeater.width/2 * 0.87
    property bool allTimeNumbers: false;

    property var listName: [0]

    Component.onCompleted: {
        for(var i = 3 ; i < 15 ; ++i)
        {
            numbersRepeater.listName[i-3] = i%12;
        }
        numbersRepeater.listName[9] =12;
        numbersRepeater.model=12;
    }

    ClockNumberText {
        x:numbersRepeater.originX + numbersRepeater.radiusCircle * Math.cos(index * 2*Math.PI/numbersRepeater.listName.length) - width/2
        y:numbersRepeater.originY + numbersRepeater.radiusCircle * Math.sin(index * 2*Math.PI/numbersRepeater.listName.length) - height/2
        font.pointSize: numbersRepeater.width >= 100 ? numbersRepeater.width/10:8;
        text: (!allTimeNumbers && (index)%3!=0) ? "": numbersRepeater.listName[index];
    }
}
