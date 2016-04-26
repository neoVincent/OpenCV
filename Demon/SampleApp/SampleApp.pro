include(../Demon.pri)

QT += core
QT -= gui

CONFIG += c++11

TARGET = SampleApp

CONFIG += console

CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp


DESTDIR = $$PACKAGE_DESTIR/SampleApp

CONFIG(debug, debug|release) {
    LIBS += -lopencv_world310d
    copyLibrary($$OPENCV_DIR/build/x64/vc12/bin,opencv_world310d,$$DESTDIR)
} else {
    LIBS += -lopencv_world310
    copyLibrary($$OPENCV_DIR/build/x64/vc12/bin,opencv_world310,$$DESTDIR)
}

