import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0

import "StarLine.js" as MyScript

/**
*
* This class has implemented a Timeteller, includes both date and time.
* A mediaPlayer, which allows user to choose soundtrack from local device.
*
*
* Author : Tracy Wang
*
*/


Window {
    id: window
    visible: true
    width: 1920
    height: 720

    property alias autoVerticalGauge: autoVerticalGauge
    property alias autoCircularGauge: autoCircularGauge
    property alias autoStatusIndicator: autoStatusIndicator
    property alias spriteAnimation: spriteAnimation

    property alias middleBoard: middleBoard
    property alias localTime: localTime
    property alias localDate: localDate
    property alias backgroundImage: backgroundImage
    property color demoFontColor: "#0fbeb9"

    title: "Dashboard MerFunction Demo"

    Image {
        id: backgroundImage
        x: 0
        y: 0
        source: "qrc:/images/base/background.png"
    }

    Item {
        id: middleBoard
        x: 0
        y: 0
        width: 1920
        height: 720


        /*
           SECTION 1: AUTO GAUGE & INDICATOR
         */


        Rectangle{
            color:"transparent"
            width:190
            height:40
            x:877
            y:50

            MarqueeText{
                id:text
                width:216
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text:"ABS System    Gauge Mode    Tire Pressure    Air/Fuel Ratio    Engine Temp    Settings    Launch Mode"
            }
        }

        Rectangle {
            id: autoCircularGauge
            Component.onCompleted: MyScript.createAutoCircularGauge();
        }

        Rectangle {
            id: autoVerticalGauge
            Component.onCompleted: MyScript.createAutoVerticalGauge();
        }

        Rectangle {
            id: autoStatusIndicator
            Component.onCompleted: MyScript.createAutoStatusIndicator();
        }

        Rectangle{
            id:spriteAnimation
            Component.onCompleted: MyScript.createSpriteAnimation();
        }

        //************************************************************************* indicator and notification
        //        Rectangle{
        //            id:comingcall
        //            x: 240
        //            y:450
        //            width:330
        //            height:248
        //            color:"transparent"

        //            AnimatedImage{
        //                anchors.fill: parent
        //                source: "qrc:/images/comingcall.gif"
        //            }
        //        }


        /*
           SECTION 2: DIGITAL CLOCK
         */


        FontLoader{
            id:localFont
            source: "qrc:/font/ufonts.com_century-schoolbook-l-roman.ttf"

        }

        ColumnLayout {
            id: clock
            anchors.verticalCenterOffset: -57
            anchors.horizontalCenterOffset: 0
            anchors.centerIn: parent

            Text {
                id: localTime
                color: demoFontColor
                styleColor: "#000000"
                font {
                    family:localFont.name
                    pixelSize: 50
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: localDate
                color: demoFontColor
                styleColor: "#000000"
                font {
                    family: localFont.name
                    pixelSize: 20
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Timer {
                interval: 500
                running: true
                repeat: true

                onTriggered: {
                    var showTheTime = new Date()
                    localTime.text = showTheTime.toLocaleTimeString(Qt.locale("en_US"),"hh:mm:ss")
                    localDate.text = showTheTime.toLocaleDateString(Qt.locale("en_US"))
                }
            }

        }


        /*
           SECTION 3: AUDIO PLAYER 2D VER.
         */

        ColumnLayout {
            id: musicPlayer2D
            x: 800
            y: 375
            width: 360
            height: 71

            AutoPlayer2D{
                anchors.fill: parent
            }
        }

        /*
           SECTION 4: CALENDARAND EVENT HANDLER
         */

        ColumnLayout {

            id: calendarEventHandler
            x: 696
            y: 483
            width: 528
            height: 229

            CalendarEventHandler{
                anchors.fill: parent
            }
        }


        /*
           SECTION 5:SPEEDO AND TACHO, SIGNAL ARROWS
         */

        ColumnLayout{
            width:1920
            height:720
            anchors.fill: parent

            Meters{
                y: 32
            }
        }


        Rectangle{
            id:arrows
            width:50
            height:50
            y:600
            color:"transparent"

            AnimatedImage{
                id:leftarrow
                x:1520
                source: "qrc:/images/signal/leftArrow.gif"
            }

            AnimatedImage{
                id:rightarrow
                x:1600
                source: "qrc:/images/signal/rightArrow.gif"
            }
        }



    }
}
