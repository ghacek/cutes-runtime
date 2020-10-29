import QtQuick 2.15
import QtQuick.Window 2.15

import QtQuick.Controls 2.15
import QtQuick.Templates 2.15
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15
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
        function onUpdateComponentSource(source) {
            if (priv.initComp) {
                priv.initComp.destroy();
            }

            priv.initComp = Qt.createQmlObject(source, rootItem, "snippet");
        }
    }
}
