import sys
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine
import context


class MainWindow(QApplication):
    engine = None
    backend = None

    def __init__(self):
        QApplication.__init__(self, sys.argv)

    def run(self):
        self.engine = QQmlApplicationEngine()
        self.backend = context.Context()
        self.engine.rootContext().setContextProperty("backend", self.backend)
        self.engine.load('MainWindow.qml')

        if not self.engine.rootObjects():
            sys.exit(-1)
        return self.exec_()


if __name__ == '__main__':
    app = MainWindow()
    sys.exit(app.run())
