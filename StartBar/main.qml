import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
//    Test{

//    }

    Rectangle{
        id: upMenu
        width: 480; height: loadUpMenu.source == "" ? 0 : 350
        x:0
        anchors{
            bottom: bottomBar.top
        }
        color: "#525454"
        Behavior on height{
            NumberAnimation {duration: 200; easing.type: Easing.OutCirc}
        }
        Loader{
            id: loadUpMenu
            source: ""
            anchors.fill: parent
        }
    }

    Rectangle{
        id: bottomBar
        width: 640; height: 40
        color: "#1E2121"
        x:0; y:440
        Rectangle{
            id: btnStart
            width: 40; height: width
            anchors{
                left: bottomBar.left
                top: bottomBar.top
            }
            MyStartBtn{}
        }
    }
}
