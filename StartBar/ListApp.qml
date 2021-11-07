import QtQuick 2.0
import QtQuick.Layouts 1.1

ListView{
    id: listView

    property string sourceList: ""
    property alias mymodel: listView.model

    currentIndex: 0
//    interactive: false
    boundsBehavior: Flickable.StopAtBounds

    section.property: "filename"
    section.criteria: ViewSection.FirstCharacter
    section.delegate: MySectionHeading {}

    delegate:
        ColumnLayout{
            id: m_delegate
            Layout.fillWidth: true
            Layout.fillHeight: true
            height: rowL.height + loadSubList.height
            spacing: 2
            state: "noExpand"
            states: [
                State {
                    name: "Expand"
                    PropertyChanges {
                        target: dropBtn
                        stateExpand: "^"
                    }
                }
            ]
            RowLayout{
                id: rowL
                Layout.fillWidth: true
                Layout.topMargin: 2
                Rectangle{
                    id: icon
                    width: 16; height: width
                    color: "yellow"
                }
                Rectangle{
                    id: nameApp
                    width: 105; height: 20
                    color: "#525454"
                    Text {
                        id: fileName
                        text: model.modelData.filename
                        color: "white"
                        font{
                            pointSize: 10
                        }
                        anchors{
                            verticalCenter: parent.verticalCenter
                        }
                        elide: Text.ElideRight
                    }
                }
                MyDropBtn {
                    id: dropBtn
                    stateExpand: model.modelData.isDir ? "v" : ""
                }
                MouseArea{
                    width: parent.width
                    height: parent.height
                    hoverEnabled: true
                    onClicked: {
                        if((model.modelData.hasChild)&&(m_delegate.state == "noExpand")){
                            loadSubList.setSource("./ListApp.qml",{"mymodel" : model.modelData.listSubDir})
                            console.log("load sub list")
                            m_delegate.state = "Expand"
                        }
                        else{
                            loadSubList.setSource("")
                            m_delegate.state = "noExpand"
                        }
                    }
                    onEntered: {
                        nameApp.color = "#C6C7C7"
                    }
                    onExited: {
                        nameApp.color = "#525454"
                    }
                }
            }
            Loader{
                id: loadSubList
                width: 100
                height: m_delegate.state == "noExpand"? 0 : model.modelData.count * 20
                Layout.fillHeight: true
                Layout.fillWidth: true
                source: listView.sourceList
                Layout.leftMargin: 5
                Behavior on height { NumberAnimation {duration: 200; easing.type: Easing.Linear}}
            }

        }   
}




