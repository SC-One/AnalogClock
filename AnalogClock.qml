import QtQuick 2.15
Rectangle{
    id:clockRoot
    radius: width/2
    color:"gray"
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
