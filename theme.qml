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
    readonly property real cellRatio: 16 / 9
    readonly property int cellHeight: rpx(130)
    readonly property int cellWidth: cellHeight * cellRatio
    readonly property int cellSpacing: rpx(10)
    readonly property int cellPaddedWidth: cellWidth + cellSpacing

    // category labels of rows
    readonly property int labelFontSize: rpx(18)
    readonly property int labelHeight: labelFontSize * 2.5

    // layout
    readonly property int leftGuideline: rpx(100)


    Screenshot {
        anchors {
            top: parent.top
            right: parent.right
            bottom: selectionMarker.top
            bottomMargin: -labelHeight
        }
    }

    Details {
        anchors {
            top: parent.top
            left: parent.left; leftMargin: leftGuideline
            bottom: platformAxis.top; bottomMargin: labelHeight * 2
            right: parent.horizontalCenter
        }
    }

    Rectangle {
        id: selectionMarker

        width: cellWidth
        height: cellHeight
        z: 100

        anchors {
            left: parent.left
            leftMargin: leftGuideline
            bottom: parent.bottom
            bottomMargin: labelHeight + cellHeight + rpx(5)
        }

        color: "transparent"
        border { width: 3; color: "white" }
    }

    PathView {
        id: platformAxis

        width: parent.width
        height: 2 * (labelHeight + cellHeight) + rpx(5)
        anchors.bottom: parent.bottom

        model: pegasus.platforms
        delegate: platformAxisDelegate

        pathItemCount: 3
        readonly property int pathLength: (labelHeight + cellHeight) * 3
        path: Path {
            startX: platformAxis.width * 0.5
            startY: (labelHeight + cellHeight) * -0.5
            PathLine {
                x: platformAxis.path.startX
                y: platformAxis.path.startY + platformAxis.pathLength
            }
        }

        snapMode: PathView.SnapOneItem
        highlightRangeMode: PathView.StrictlyEnforceRange
        clip: true

        preferredHighlightBegin: 1 / 3
        preferredHighlightEnd: preferredHighlightBegin

        focus: true
        Keys.onUpPressed: decrementCurrentIndex()
        Keys.onDownPressed: incrementCurrentIndex()
        Keys.onLeftPressed: currentItem.prev()
        Keys.onRightPressed: currentItem.next()

        onCurrentIndexChanged: pegasus.currentPlatformIndex = currentIndex
    }

    Component {
        id: platformAxisDelegate

        Item {
            property alias axis: gameAxis

            Component.onCompleted: {
                if (currentGameIndex >= 0)
                    gameAxis.currentIndex = currentGameIndex;
            }
            function next() {
                gameAxis.incrementCurrentIndex();
                currentGameIndex = gameAxis.currentIndex;
            }
            function prev() {
                gameAxis.decrementCurrentIndex();
                currentGameIndex = gameAxis.currentIndex;
            }

            width: PathView.view.width
            height: labelHeight + cellHeight

            visible: PathView.onPath
            opacity: PathView.isCurrentItem ? 1.0 : 0.6
            Behavior on opacity { NumberAnimation { duration: 150 } }

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
                    bold: true
                    capitalization: longName ? Font.MixedCase : Font.AllUppercase
                }
            }

            PathView {
                id: gameAxis

                width: parent.width
                height: cellHeight
                anchors.bottom: parent.bottom

                model: games
                delegate: GameAxisCell {
                    game: modelData
                    width: cellWidth
                    height: cellHeight
                }

                pathItemCount: 2 + Math.ceil(width / cellPaddedWidth)
                property int fullPathWidth: pathItemCount * cellPaddedWidth
                path: Path {
                    startX: leftGuideline - cellPaddedWidth * 1.5
                    startY: cellHeight * 0.5
                    PathLine {
                        x: gameAxis.path.startX + gameAxis.fullPathWidth
                        y: gameAxis.path.startY
                    }
                }

                snapMode: PathView.SnapOneItem
                highlightRangeMode: PathView.StrictlyEnforceRange
                clip: true

                preferredHighlightBegin: (2 * cellPaddedWidth - cellSpacing / 2) / fullPathWidth
                preferredHighlightEnd: preferredHighlightBegin
            }
        }
    }
}
