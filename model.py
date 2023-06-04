from tensorflow import keras

class Model:
    def __init__(self):
        self.model = keras.models.load_model('saved_model')

    def predict_value(self, patient, name):
        prediction = self.model.predict(patient)
        return "Вероятность наличия ишемической болезни сердца у пациента " + \
            name + ": " + str(round(prediction[0][0]*100, 3)) + "%"
