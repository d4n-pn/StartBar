import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle{
    id: leftBar
    width: 40; height: 350
    color: "#525454"

    ColumnLayout{
        anchors.fill: parent
        MyBtn {
            id: btnExpand
            image: "qrc:/images/icons8-list-30.png"
        }
        Rectangle{
            id: space
            width: parent.width
            height: 30
            Layout.fillHeight: true
            opacity: 0
        }

        MyBtn {
            id: btnShutdown
            image: "qrc:/images/icons8-shutdown-30.png"           
        }
        MyBtn {
            id: btnSetting
            image: "qrc:/images/icons8-setting-30.png"            
        }
        MyBtn {
            id: btnPictures
            image: "qrc:/images/icons8-image-30.png"           
        }
        MyBtn {
            id: btnDocuments
            image: "qrc:/images/icons8-paper-30.png"           
        }
        MyBtn {
            id: btnMyComputer
            image: "qrc:/images/icons8-person-30.png"            
        }
    }
}
