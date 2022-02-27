import QtQuick 2.15
import QtQuick.Layouts 1.3
Rectangle
{
    id:equalWindowSizeRect
    property color clockBgColor: "gray"
    property real hours:0
    property real minutes:0
    property real seconds:0
    color:"transparent"
    Rectangle {
        id:clockRoot
        width: Math.min(equalWindowSizeRect.height,equalWindowSizeRect.width)
        height: width
        radius: width/2
        anchors.centerIn: parent
        color:equalWindowSizeRect.clockBgColor
        NumberRepeater{
            id:repeaterNumbers
            anchors.fill: parent
            allTimeNumbers: true
        }

        QtObject
        {
            id: props;
            property real handFactorGama: 0.4
        }
        ClockHand{
            id:second
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height/2 - second.height
            width: clockRoot.width*0.1
            height: clockRoot.height*0.4
            angleRotate: equalWindowSizeRect.seconds * 360 / 60;   // 12 hours format
            bgColorStart: "black"
            bgColorEnd: "green"
        }
        ClockHand{
            id:minHand
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height/2 - minHand.height
            width: clockRoot.width*0.08
            height: clockRoot.height*0.4
            angleRotate: equalWindowSizeRect.minutes * 360 / 60;   // 12 hours format
        }
        ClockHand{
            id:hourHand
            anchors.horizontalCenter: clockRoot.horizontalCenter
            y: clockRoot.height/2 - hourHand.height
            width: minHand.width;
            height: minHand.height*props.handFactorGama;
            angleRotate: equalWindowSizeRect.hours * 360 / 12;   // 12 hours format
        }
    }
}
