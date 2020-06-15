import QtQuick 2.14
import QtQuick.Window 2.14

import QtQuick.Controls 2.14
import QtQuick.Templates 2.14
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.14
import QtQuick.Shapes 1.14
import QtGraphicalEffects 1.14
//import QtQuick.LocalStorage 2.12

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Cutes Preview")

    QtObject {
        id: priv

        property var initComp;
    }

    Item {
        id: rootItem
        anchors.fill: parent
    }

    Connections {
        target: bridge
        onUpdateComponentSource: {
            if (priv.initComp) {
                priv.initComp.destroy();
            }

            priv.initComp = Qt.createQmlObject(source, rootItem, "snippet");
        }
    }
}
