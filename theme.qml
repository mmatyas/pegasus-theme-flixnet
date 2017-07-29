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

    // layout
    readonly property int leftGuideline: rpx(100)


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
        Keys.onLeftPressed: currentItem.axis.decrementCurrentIndex()
        Keys.onRightPressed: currentItem.axis.incrementCurrentIndex()
    }

    Component {
        id: platformAxisDelegate

        Item {
            property alias axis: gameAxis

            width: ListView.view.width
            height: labelHeight + cellHeight

            Text {
                text: longName || shortName

                height: labelHeight
                verticalAlignment: Text.AlignVCenter

                anchors.left: parent.left
                anchors.leftMargin: leftGuideline

                color: "white"
                font {
                    pixelSize: labelFontSize
                    family: uiFont.name
                }
            }

            ListView {
                id: gameAxis

                width: parent.width
                height: cellHeight

                anchors.bottom: parent.bottom

                model: games
                delegate: gameAxisDelegate

                orientation: ListView.Horizontal
                spacing: cellSpacing
                snapMode: ListView.SnapOneItem
                highlightRangeMode: ListView.StrictlyEnforceRange
                clip: true

                preferredHighlightBegin: leftGuideline
                preferredHighlightEnd: preferredHighlightBegin + cellWidth
            }
        }
    }

    Component {
        id: gameAxisDelegate

        Rectangle {
            width: cellWidth
            height: cellHeight

            color: ListView.isCurrentItem ? "orange" : "blue"

            Text {
                text: index
                anchors.centerIn: parent
                color: "white"
            }
        }
    }
}
