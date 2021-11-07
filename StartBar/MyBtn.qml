import QtQuick 2.0

Rectangle{
    id: root
    width: 40; height: 40
    property alias image: image.source
    color: "#525454"
    Image {
        id: image
        source: ""
        anchors.centerIn: root
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            console.log("btn clicked")
        }
        onEntered: {
            root.color = "#C6C7C7"
        }
        onExited: {
            root.color = "#525454"
        }
    }
}
