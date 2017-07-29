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
    property int fontSize: rpx(16)

    height: fontSize + rpx(8)
    spacing: rpx(10)


    RatingBar {
        percent: game.rating
        size: fontSize
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        text: game.year ? game.year : ""

        anchors.verticalCenter: parent.verticalCenter

        color: "#eee"
        font {
            pixelSize: fontSize
            family: uiFont.name
        }
    }

    Rectangle {
        property bool multiplayer: game.players > 1

        width: text.width + rpx(8)
        height: text.height + rpx(2)

        color: "#505050"
        radius: rpx(3)

        visible: multiplayer

        anchors.verticalCenter: parent.verticalCenter

        Text {
            id: text

            anchors.centerIn: parent

            text: {
                var str = "";
                for (var i = 0; i < game.players; i++)
                    str += "\u263B"
                return str;
            }

            color: "#eee"
            font {
                pixelSize: fontSize
                family: uiFont.name
            }
        }
    }

    Text {
        text: game.developer

        anchors.verticalCenter: parent.verticalCenter

        color: "#eee"
        font {
            pixelSize: fontSize
            family: uiFont.name
        }
    }
}
