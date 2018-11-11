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
import QtGraphicalEffects 1.0


Image {
    property var game: api.currentGame

    visible: game

    asynchronous: true
    fillMode: Image.PreserveAspectFit

    source: (game && game.assets.screenshots[0]) || ""
    sourceSize { width: 512; height: 512 }


    LinearGradient {
        width: parent.width
        height: labelHeight * 2

        anchors.bottom: parent.bottom

        start: Qt.point(0, height)
        end: Qt.point(0, 0)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#FF000000" }
            GradientStop { position: 1.0; color: "#00000000" }
        }
    }

    LinearGradient {
        width: parent.width * 0.25
        height: parent.height

        anchors.left: parent.left

        start: Qt.point(0, 0)
        end: Qt.point(width, 0)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#FF000000" }
            GradientStop { position: 1.0; color: "#00000000" }
        }
    }
}
