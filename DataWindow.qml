import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.1
import QtQuick.Window 2.1


ApplicationWindow {
    id: root
    visible: true
    modality: Qt.ApplicationModal    
    width: 1024
    height: 700
    title: "PredictiveValue"
    maximumHeight: 1080
    maximumWidth: 1920

    minimumHeight: 700
    minimumWidth: 1024
    color: "#c2c2c2"



    GridLayout {
        id: grid
        anchors.fill: parent
	anchors.leftMargin: 10
	anchors.rightMargin: 10
	anchors.topMargin: 60
	anchors.bottomMargin: 80
        rows: 10
        columns: 5
        
        TextField{
	    id: name
	    selectByMouse: true
	    font.bold: true
            font.pointSize: 16
	    color: "#444b55"
            validator: RegExpValidator { regExp: /^(?=.{0,20}$)[A-Za-zА-яа-я\s]+$/ }
            onDisplayTextChanged: {
            backend.setName(name.text)
            }
            Layout.row: 1
            Layout.column: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ComboBox{
            id: sex
            displayText: ""
            model: ["Женский", "Mужской"]
            font.bold: true
            font.pointSize: 16
            Layout.row: 2
            Layout.column: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
            onActivated: {
                displayText = currentIndex.text;
                backend.activatedSex(currentIndex)
            }
        }
        TextField{
	    id: age
	    selectByMouse: true
	    font.bold: true
            font.pointSize: 16
	    color: "#444b55"
            validator: RegExpValidator { regExp: /[0-9]+/ }
            Layout.row: 3
            Layout.column: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
	    onDisplayTextChanged: {
		color = backend.checkAge(age.text)
	    }
        }
        TextField{
            id: height
            selectByMouse: true
            font.bold: true
            font.pointSize: 16
            color: "#444b55"
            validator: RegExpValidator { regExp: /[0-9]+/ }
            Layout.row: 4
            Layout.column: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
            onDisplayTextChanged: {
                color = backend.checkHeight(height.text)
            }
        }
        TextField{
	    id: weight
	    selectByMouse: true
	    font.bold: true
            font.pointSize: 16
	    color: "#444b55"
	    validator: RegExpValidator { regExp: /[0-9]+/ }
            Layout.row: 5
            Layout.column: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
	    onDisplayTextChanged: {
		color = backend.checkWeight(weight.text)
	    }
        }
        ComboBox{
	    id: stroke
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Нет", "Есть"]
	    onActivated: {
		displayText = currentIndex.text;
		backend.activatedStroke(currentIndex)
	    }
            Layout.row: 6
            Layout.column: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ComboBox{
	    id: diabetes
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Нет", "Есть"]
	    onActivated: {
		displayText = currentIndex.text;
		backend.activatedDiabetes(currentIndex)
	    }
            Layout.row: 7
            Layout.column: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ComboBox{
	    id: highbp
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Нет", "Есть"]
	    onActivated: {
		displayText = currentIndex.text;
        backend.activatedHighBP(currentIndex)
	    }
            Layout.row: 8
            Layout.column: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ComboBox{
	    id: highchol
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Нет", "Есть"]
	    onActivated: {
		displayText = currentIndex.text;
        backend.activatedHighChol(currentIndex)
	    }
            Layout.row: 9
            Layout.column: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ComboBox{
	    id: physactivity
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Нет", "Есть"]
	    onActivated: {
		displayText = currentIndex.text;
		backend.activatedPhysActivity(currentIndex)
	    }
            Layout.row: 10
            Layout.column: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        
        
        
        Text{
            text: "Имя"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 1
            Layout.column: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Пол"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 2
            Layout.column: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Возраст"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 3
            Layout.column: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Рост, см"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 4
            Layout.column: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Вес, кг"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 5
            Layout.column: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Инсульт/инфаркт"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 6
            Layout.column: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Диабет"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 7
            Layout.column: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Высокое давление"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 8
            Layout.column: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Высокий холестерин"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 9
            Layout.column: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Физическая нагрузка"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 10
            Layout.column: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ComboBox{
	    id: healthfood
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Нет", "Есть"]
	    onActivated: {
		displayText = currentIndex.text;
		backend.activatedHealthFood(currentIndex)
	    }
            Layout.row: 1
            Layout.column: 3
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ComboBox{
	    id: smoker
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Нет", "Есть"]
	    onActivated: {
		displayText = currentIndex.text;
		backend.activatedSmoker(currentIndex)
	    }
            Layout.row: 2
            Layout.column: 3
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ComboBox{
	    id: alcohol
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Нет", "Есть"]
	    onActivated: {
		displayText = currentIndex.text;
		backend.activatedHvyAlcoholConsump(currentIndex)
	    }
            Layout.row: 3
            Layout.column: 3
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ComboBox{
	    id: healthcare
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Нет", "Есть"]
	    onActivated: {
		displayText = currentIndex.text;
		backend.activatedHealthCare(currentIndex)
	    }
            Layout.row: 4
            Layout.column: 3
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ComboBox{
	    id: genhlth
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Отличное", "Хорошее", "Нормальное", "Удовлетворительное", "Плохое"]
	    onActivated: {
		displayText = currentIndex.text;
		backend.activatedGenHlth(currentIndex)
	    }
            Layout.row: 5
            Layout.column: 3
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        TextField{
	    id: menthlth
	    selectByMouse: true
	    font.bold: true
            font.pointSize: 16
	    color: "#444b55"
	    validator: RegExpValidator { regExp: /[0-9]+/ }
            Layout.row: 6
            Layout.column: 3
            Layout.fillHeight: true
            Layout.fillWidth: true
	    onDisplayTextChanged: {
		color = backend.checkMentHlth(menthlth.text)
	    }
        }
        TextField{
	    id: physhlth
	    selectByMouse: true
	    font.bold: true
            font.pointSize: 16
	    color: "#444b55"
	    validator: RegExpValidator { regExp: /[0-9]+/ }
            Layout.row: 7
            Layout.column: 3
            Layout.fillHeight: true
            Layout.fillWidth: true
	    onDisplayTextChanged: {
		color = backend.checkPhysHlth(physhlth.text)
	    }
        }
        ComboBox{
	    id: diffwalk
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Нет", "Есть"]
	    onActivated: {
		displayText = currentIndex.text;
		backend.activatedDiffWalk(currentIndex)
	    }
            Layout.row: 8
            Layout.column: 3
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ComboBox{
	    id: education
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Дошкольное", "Начальное", "Основное", "Среднее", "Высшее"]
	    onActivated: {
		displayText = currentIndex.text;
		backend.activatedEducation(currentIndex)
	    }
            Layout.row: 9
            Layout.column: 3
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ComboBox{
	    id: income
	    displayText: ""
	    font.bold: true
            font.pointSize: 16
            model: ["Низкий", "Средний", "Высокий"]
	    onActivated: {
		displayText = currentIndex.text;
		backend.activatedIncome(currentIndex)
	    }
            Layout.row: 10
            Layout.column: 3
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        
        Text{
            Layout.row: 1
            Layout.column: 4
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "Здоровое питание"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
        }
        Text{
            text: "Никотиновая зависимость"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 2
            Layout.column: 4
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Алкогольная зависимость"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 3
            Layout.column: 4
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Посещение врача"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 4
            Layout.column: 4
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Общее состояние здоровья"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 5
            Layout.column: 4
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Стрессы за месяц (дни)"
            verticalAlignment: Text.AlignVCenter
            font.wordSpacing: 0
            font.bold: true
            font.pointSize: 16
            Layout.row: 6
            Layout.column: 4
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Недомогания за месяц (дни)"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 7
            Layout.column: 4
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Трудности в передвижении"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 8
            Layout.column: 4
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Образование"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 9
            Layout.column: 4
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Text{
            text: "Доход"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            Layout.row: 10
            Layout.column: 4
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }


    Button {
        id: getresultbutton
        anchors.top: grid.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        text: "Получить результат"
        font.bold: true
        font.pointSize: 16
        onClicked: {
            showMessage(backend.get_result(), "Оценка прогностической значимости")
        }
    }

    Text {
        id: text1
        width: 460
        height: 40
        text: "Введите показатели пациента"
        font.bold: true
        font.pointSize: 20
        anchors.top: parent.top
	anchors.left: parent.left
        anchors.right: parent.right
	anchors.bottom: grid.top
	anchors.margins: 10
	horizontalAlignment: Text.AlignHCenter
        font.family: Constants.font.family
    }
    function showMessage(text, title)
    {
    	messageBox.text = text;
    	messageBox.title = title;
    	messageBox.visible = true;
    }

    Window {
    	id: messageBox
    	modality: Qt.ApplicationModal
    	title: ""
    	visible: false
    	property alias text: messageBoxLabel.text
    	color: parent.color
        maximumHeight: 150
        maximumWidth: 600
        minimumHeight: 150
        minimumWidth: 600
    	Label {
        	anchors.margins: 20
        	anchors.top: parent.top
        	anchors.left: parent.left
        	anchors.right: parent.right
        	anchors.bottom: messageBoxButton.top
        	horizontalAlignment: Text.AlignHCenter
        	wrapMode: Text.WordWrap
        	id: messageBoxLabel
        	text: ""
            font.bold: true
            font.pointSize: 16
    	}
    	Button {
        	anchors.margins: 10
        	id: messageBoxButton
        	anchors.bottom: parent.bottom
        	anchors.horizontalCenter: parent.horizontalCenter
        	text: "OK"
        	onClicked: messageBox.visible = false
    	}
    }
    Connections {
        target: backend
    }
}
