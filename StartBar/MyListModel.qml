import QtQuick 2.0
ListModel {
    id: listModel
    ListElement {
        name: "Apple"
        child: true
        sub: [
            ListElement { name: "Core" ;child: false },
            ListElement { name: "Deciduous"; child: false }
        ]
    }
    ListElement {
        name: "Orange"
        child: true
        sub: [
            ListElement { name: "Co" ;child: false },
            ListElement { name: "Dec"; child: false }
        ]
    }
}
