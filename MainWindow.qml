import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: root    
    visible: true    
    width: 1024
    height: 700
    title: "PredictiveValue"
    maximumHeight: 1080
    maximumWidth: 1920

    minimumHeight: 700
    minimumWidth: 1024
    
    color: "#c2c2c2"

    Text {
        width: 586
        height: 106
        text: qsTr("Оценка прогностической значимости")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        font.pointSize: 20
        anchors.verticalCenterOffset: -268
        anchors.centerIn: parent
        font.family: Constants.font.family
    }

    Button {
        id: openinputview
        width: 407
        height: 96
        text: "Ввести данные пациента"
        font.bold: true
        font.pointSize: 16
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 268
        onClicked: {
            var component = Qt.createComponent("DataWindow.qml");
            var window = component.createObject(root);
	    conn.target = window;
        }
    }

    Image {
        id: image
        x: 430
        y: 264
        width: 164
        height: 162
	anchors.centerIn: parent
        source: "medical-record.png"
        fillMode: Image.PreserveAspectFit
    }

    Connections {
	id: conn
        onVisibleChanged: {
            mainWindow.show();
        }
        target: backend
    }
}
