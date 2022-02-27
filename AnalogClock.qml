import QtQuick 2.15
import QtQuick.Layouts 1.3
Rectangle
{
    id:equalWindowSizeRect
    property color clockBgColor: "gray"
    color:"transparent"
    Rectangle{
        id:clockRoot
        width: Math.min(equalWindowSizeRect.height,equalWindowSizeRect.width)
        height: width
        radius: width/2
        anchors.centerIn: parent
        color:equalWindowSizeRect.clockBgColor
        Repeater {
            id:numbersRepeater
            anchors.fill: parent
            model: 4
            property real originX: numbersRepeater.width/2
            property real originY: numbersRepeater.height/2
            property real radiusCircle: numbersRepeater.width/2*0.9
            readonly property var listName: [3,6,9,12]
            ClockNumberText {
                x:numbersRepeater.originX + numbersRepeater.radiusCircle * Math.cos(index * 2*Math.PI/4) - width/2
                y:numbersRepeater.originY + numbersRepeater.radiusCircle * Math.sin(index * 2*Math.PI/4) - height/2
                font.pointSize: numbersRepeater.width >= 100 ? numbersRepeater.width/10:8;
                text: numbersRepeater.listName[index]
            }
        }
        QtObject
        {
            id: props;
            property real handFactorGama: 0.4
        }
        ClockHand{
            id:minHand
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height/2 - minHand.height
            width: clockRoot.width*0.08
            height: clockRoot.height*0.4
            angleRotate: 100    // test
        }
        ClockHand{
            id:hourHand
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height/2 - hourHand.height
            width: minHand.width;
            height: minHand.height*props.handFactorGama;
        }
    }
}
