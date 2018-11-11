// Pegasus Frontend - Flixnet theme
// Copyright (C) 2017  Mátyás Mustoha
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.


import QtQuick 2.7

import "qrc:/qmlutils" as PegasusUtils


Item {
    property var game: api.currentGame

    visible: game

    Text {
        id: title
        text: game ? game.title : ""

        anchors.top: parent.top
        anchors.topMargin: font.pixelSize * 1.5

        color: "#eee"
        font {
            pixelSize: vpx(28)
            family: globalFonts.sans
            bold: true
        }
    }

    DetailsInfoBar {
        id: infobar

        anchors.top: title.bottom
        anchors.topMargin: vpx(5)
    }

    PegasusUtils.AutoScroll {
        anchors {
            top: infobar.bottom; topMargin: vpx(20)
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Text {
            text: game ? game.description : ""

            width: parent.width

            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignJustify

            color: "#eee"
            font {
                pixelSize: vpx(16)
                family: globalFonts.sans
            }
        }
    }
}
