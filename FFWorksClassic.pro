TEMPLATE = app
TARGET = FFWorksClassic
CONFIG += qt warn_on
QT += core declarative
LIBS += -lbbcascades
SOURCES += src/main.cpp

lupdate_inclusion { }
