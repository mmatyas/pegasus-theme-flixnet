// Pegasus Frontend - Flixnet theme
// Copyright (C) 2022  Mátyás Mustoha
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


Item {
    id: root

    property int playerCount
    property int size

    readonly property real padding: size * 0.2

    width: size * playerCount + padding * 2
    height: size + padding * 2

    Image {
        id: img

        anchors.fill: parent
        anchors.margins: root.padding

        source: "assets/smiley.svg"
        sourceSize { width: root.size; height: root.size }

        fillMode: Image.TileHorizontally
        horizontalAlignment: Image.AlignLeft
        verticalAlignment: Image.AlignTop
    }

    Rectangle {
        anchors.fill: parent
        color: "#505050"
        radius: root.size * 0.15
        z: -1
    }
}

