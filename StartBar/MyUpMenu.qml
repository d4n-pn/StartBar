import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    id: root
    anchors.fill: parent

    RowLayout{
        MyLeftBar {
            id: leftBar
        }
        Rectangle{
            id: listApp
            width: 200; height: 350
            color: "#525454"
            Loader{
                id: loader1
                anchors.fill: parent
                onLoaded: {
                    console.log("loaded")
                }
            }

            MyListModel{
                id: mymodel
            }
        }
        Component.onCompleted: {
            loader1.setSource("./ListApp.qml",{"mymodel": LModel})
        }
    }
}
