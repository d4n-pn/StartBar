import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.1

Rectangle{
    id: root
    width: parent.width; height: width
    color: "#1E2121"

    property color colorWindow: "white"
    state: "origin"

    GridLayout{
        width: root.width - 4; height: width
        columns: 2
        columnSpacing: 1
        anchors.centerIn: parent

        Rectangle{
            width: parent.width/2-2;height: width
            color: root.colorWindow
        }
        Rectangle{
            width: parent.width/2-2;height: width
            color: root.colorWindow
        }
        Rectangle{
            width: parent.width/2-2;height: width
            color: root.colorWindow
        }
        Rectangle{
            width: parent.width/2-2;height: width
            color: root.colorWindow
        }
    }
    states: [
        State {
            name: "selected"
            PropertyChanges {
                target: root
//                colorWindow: "#C6C7C7"
                color: "#7D7F80"
            }
        }
    ]
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            loadUpMenu.source = loadUpMenu.source == "qrc:/MyUpMenu.qml" ? "" : "qrc:/MyUpMenu.qml"
            root.state = root.state == "selected" ? "origin" : "selected"
        }
        onEntered: {
            root.colorWindow = "#C6C7C7"
        }
        onExited: {
            root.colorWindow = "white"
        }
    }
    transitions: [
        Transition {
            from: "*"
            to: "*"

            ColorAnimation {
                target: root
                duration: 70
            }
        }
    ]
}
