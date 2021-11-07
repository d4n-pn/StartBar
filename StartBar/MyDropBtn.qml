import QtQuick 2.0
Item{
    id: dropBtn
    property string stateExpand: ""
    width: 20; height:20

    Text {
        id: drop
        text: dropBtn.stateExpand
        font{
            pointSize: 10
        }
        color: "white"
        anchors{
            centerIn: parent
        }
    }
}
