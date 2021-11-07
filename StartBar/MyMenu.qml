import QtQuick 2.0

Item {
//  id: objRecursiveDelegate
//  Column {
//     id: objRecursiveColumn
//     clip: true
//     MouseArea {
//        width: objRow.implicitWidth
//        height: objRow.implicitHeight
//    //for collapsing and expanding
//        onDoubleClicked: {
//       //remember that Repeater is also a child of objRecursiveColumn. Altering
//      //it's visiblity serves no purpose and is wasteful so thus we avoid looping
//          //over it by  parent.children.length - 1. i starts from 1 because we don't
//          //want to affect the visiblity of 0th child which is this MouseArea itself.
//      //Also note that making a child invisible will also make all
//          //children/grandchildren of the child invisible too - nice.
//           for(var i = 1; i < parent.children.length - 1; ++i) {
//              parent.children[i].visible = !parent.children[i].visible
//           }
//        }
//        Row {
//           id: objRow
//       //for indentation
//           Rectangle {
//              height: 1
//              width: model.level * 20
//           }
//           Text {
//      //if collapsed, show + else show -. If no child-nodes then show nothing
//              //(cannot be collapsed or expanded)
//              text: (objRecursiveColumn.children.length > 2 ?
//                          objRecursiveColumn.children[1].visible ?
//                          qsTr("-  ") : qsTr("+ ") : qsTr("   ")) + model.name
//              color: objRecursiveColumn.children.length > 2 ? "blue" : "yellow"
//              font { bold: true; pixelSize: 14 }
//           }
//        }
//     }
//     Repeater {
//        model: subNode
//        delegate: objRecursiveDelegate
//     }
//  }
}
