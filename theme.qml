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

        onCurrentIndexChanged: pegasus.currentPlatformIndex = currentIndex
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

                onCurrentIndexChanged:
                    pegasus.currentPlatform.currentGameIndex = currentIndex
            }
        }
    }

    Component {
        id: gameAxisDelegate

        Item {
            width: cellWidth
            height: cellHeight

            Rectangle {
                anchors.fill: parent
                color: "#333"
                visible: !assets.gridicon || image.status === Image.Loading

                Image {
                    anchors.centerIn: parent

                    visible: image.status === Image.Loading
                    source: "qrc:/common/loading-spinner.png"

                    RotationAnimator on rotation {
                        loops: Animator.Infinite
                        from: 0; to: 360
                        duration: 500
                    }
                }

                Text {
                    text: model.title

                    width: parent.width * 0.8
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.Wrap

                    anchors.centerIn: parent
                    visible: !model.assets.gridicon

                    color: "#eee"
                    font {
                        pixelSize: rpx(16)
                        family: uiFont.name
                    }
                }
            }

            Image {
                id: image

                anchors.fill: parent
                visible: model.assets.gridicon

                asynchronous: true
                source: assets.gridicon ? "file:" + assets.gridicon : ""
                sourceSize { width: 256; height: 256 }
            }
        }
    }
}
