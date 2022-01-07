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


Row {
    property int fontSize: vpx(16)

    height: fontSize + vpx(2)
    spacing: vpx(10)


    RatingBar {
        percent: game ? game.rating : 0
        size: fontSize

        visible: percent > 0
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        text: (game && game.releaseYear > 0) ? game.releaseYear : ""
        color: "#eee"
        font {
            pixelSize: fontSize
            family: globalFonts.sans
        }

        visible: text
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        text: game ? game.developer : ""
        color: "#eee"
        font {
            pixelSize: fontSize
            family: globalFonts.sans
        }

        anchors.verticalCenter: parent.verticalCenter
    }

    PlayerBar {
        size: fontSize
        playerCount: game ? game.players : 1
        visible: playerCount > 1
        anchors.verticalCenter: parent.verticalCenter
    }
}
