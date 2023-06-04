import pandas as pd
from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal
import model

class Context(QObject):
    colorChanged = pyqtSignal()
    def __init__(self):
        QObject.__init__(self)
        self.height = None
        self.weight = None
        self.name = ''
        self.info = {"HighBP": None, "HighChol": None,
                     "CholCheck": None, "BMI": None, "Smoker": None,
                     "Stroke": None, "Diabetes": None, "PhysActivity": None,
                     "Fruits": None, "Veggies": None, "HvyAlcoholConsump": None,
                     "AnyHealthcare": None, "NoDocbcCost": None, "GenHlth": None,
                     "MentHlth": None, "PhysHlth": None, "DiffWalk": None, "Sex": None,
                     "Age": None, "Education": None, "Income": None}

    @pyqtSlot(str)
    def setName(self, msg):
        self.name = msg
    @pyqtSlot(int)
    def activatedHighBP(self, msg):
        self.info["HighBP"] = float(msg)

    @pyqtSlot(int)
    def activatedHighChol(self, msg):
        self.info["HighChol"] = float(msg)
        self.info["CholCheck"] = float(msg)

    @pyqtSlot(int)
    def activatedSmoker(self, msg):
        self.info["Smoker"] = float(msg)

    @pyqtSlot(int)
    def activatedStroke(self, msg):
        self.info["Stroke"] = float(msg)

    @pyqtSlot(int)
    def activatedDiabetes(self, msg):
        if msg == 1:
            self.info["Diabetes"] = float(msg + 1)
        else:
            self.info["Diabetes"] = float(msg)

    @pyqtSlot(int)
    def activatedPhysActivity(self, msg):
        self.info["PhysActivity"] = float(msg)

    @pyqtSlot(int)
    def activatedHealthFood(self, msg):
        self.info["Fruits"] = float(msg)
        self.info["Veggies"] = float(msg)

    @pyqtSlot(int)
    def activatedHvyAlcoholConsump(self, msg):
        self.info["HvyAlcoholConsump"] = float(msg)

    @pyqtSlot(int)
    def activatedHealthCare(self, msg):
        self.info["AnyHealthcare"] = float(msg)
        self.info["NoDocbcCost"] = float(msg)

    @pyqtSlot(int)
    def activatedGenHlth(self, msg):
        self.info["GenHlth"] = float(msg)

    @pyqtSlot(int)
    def activatedDiffWalk(self, msg):
        self.info["DiffWalk"] = float(msg)

    @pyqtSlot(int)
    def activatedSex(self, msg):
        self.info["Sex"] = float(msg)

    @pyqtSlot(int)
    def activatedEducation(self, msg):
        self.info["Education"] = float(msg + 1)

    @pyqtSlot(int)
    def activatedIncome(self, msg):
        if msg == 0:
            self.info["Income"] = float(msg + 2)
        elif msg == 1:
            self.info["Income"] = float(msg + 4)
        elif msg == 2:
            self.info["Income"] = float(msg + 6)

    @pyqtSlot(str, result=str)
    def checkAge(self, message):
        if message == "":
            self.info["Age"] = None
            return "#ff0000"
        msg = int(message)
        if -1 < msg <= 120:
            if msg < 18:
                self.info["Age"] = 1.0
            elif msg > 78:
                self.info["Age"] = 13.0
            else:
                self.info["Age"] = float((msg - 13) // 5)
            return "#444b55"
        else:
            self.info["Age"] = None
            return "#ff0000"

    @pyqtSlot(str, result=str)
    def checkWeight(self, message):
        if message == "":
            self.weight = None
            return "#ff0000"
        msg = int(message)
        if 0 < msg <= 400:
            self.weight = msg
            if self.weight and self.height:
                self.info["BMI"] = float(self.weight / (self.height ** 2) * 100)
            return "#444b55"
        else:
            self.weight = None
            return "#ff0000"

    @pyqtSlot(str, result=str)
    def checkHeight(self, message):
        if message == "":
            self.height = None
            return "#ff0000"
        msg = int(message)
        if 49 < msg <= 230:
            self.height = msg
            if self.weight and self.height:
                self.info["BMI"] = float(self.weight / (self.height ** 2) * 100)
            return "#444b55"
        else:
            self.height = None
            return "#ff0000"

    @pyqtSlot(str, result=str)
    def checkMentHlth(self, message):
        if message == "":
            self.info["MentHlth"] = None
            return "#ff0000"
        msg = int(message)
        if -1 < msg <= 30:
            self.info["MentHlth"] = float(msg/30)
            return "#444b55"
        else:
            self.info["MentHlth"] = None
            return "#ff0000"

    @pyqtSlot(str, result=str)
    def checkPhysHlth(self, message):
        if message == "":
            self.info["PhysHlth"] = None
            return "#ff0000"
        msg = int(message)
        if -1 < msg <= 30:
            self.info["PhysHlth"] = float(msg/30)
            return "#444b55"
        else:
            self.info["PhysHlth"] = None
            return "#ff0000"
    @pyqtSlot(result=str)
    def get_result(self):
        if None in self.info.values():
            return "Введены некорректные данные."
        else:
            patient = pd.DataFrame([self.info])
            trained_model = model.Model()
            print(self.info)
            return trained_model.predict_value(patient, self.name)