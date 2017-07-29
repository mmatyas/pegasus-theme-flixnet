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


FocusScope {
    focus: true

    // grid icons
    readonly property real cellRatio: 460 / 215
    readonly property int cellHeight: rpx(130)
    readonly property int cellWidth: cellHeight * cellRatio
    readonly property int cellSpacing: rpx(10)
    readonly property int cellPaddedWidth: cellWidth + cellSpacing

    // category labels of rows
    readonly property int labelFontSize: rpx(18)
    readonly property int labelHeight: labelFontSize * 2.5


    ListView {
        id: platformAxis

        width: parent.width
        height: 2 * (labelHeight + cellHeight) + rpx(5)
        anchors.bottom: parent.bottom

        model: pegasus.platforms
        delegate: platformAxisDelegate

        snapMode: ListView.SnapOneItem
        highlightRangeMode: ListView.StrictlyEnforceRange
        clip: true

        focus: true
    }

    Component {
        id: platformAxisDelegate

        Rectangle {
            width: ListView.view.width
            height: labelHeight + cellHeight
            color: ListView.isCurrentItem ? "orange" : "blue"

            Text {
                text: index
                color: "white"

                anchors.centerIn: parent
            }
        }
    }
}
