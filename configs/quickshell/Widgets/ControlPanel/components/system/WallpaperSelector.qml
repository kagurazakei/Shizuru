import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import "root:/Data" as Data

Item {
    id: root

    property bool isVisible: false
    signal visibilityChanged(bool visible)

    anchors.fill: parent
    visible: isVisible
    enabled: visible
    clip: true

    property bool containsMouse: wallpaperSelectorMouseArea.containsMouse || scrollView.containsMouse
    property bool menuJustOpened: false
    property int currentIndex: -1

    onContainsMouseChanged: {
        if (containsMouse) {
            hideTimer.stop()
        } else if (!menuJustOpened && !isVisible) {
            hideTimer.restart()
        }
    }

    onVisibleChanged: {
        if (visible) {
            menuJustOpened = true
            hideTimer.stop()
            Qt.callLater(function() {
                menuJustOpened = false
                if (wallpaperGrid.count > 0) {
                    currentIndex = Data.WallpaperManager.wallpaperList.indexOf(Data.WallpaperManager.currentWallpaper)
                    if (currentIndex < 0) currentIndex = 0
                    wallpaperGrid.positionViewAtIndex(currentIndex, GridView.Contain)
                }
            })
        }
    }

    // Enhanced keyboard navigation with animation
    Keys.onPressed: {
        if (!visible) return

        var prevIndex = currentIndex

        switch (event.key) {
            case Qt.Key_Left:
                if (currentIndex > 0) {
                    currentIndex--
                    animateSelection(prevIndex, currentIndex)
                    wallpaperGrid.positionViewAtIndex(currentIndex, GridView.Contain)
                }
                event.accepted = true
                break
            case Qt.Key_Right:
                if (currentIndex < wallpaperGrid.count - 1) {
                    currentIndex++
                    animateSelection(prevIndex, currentIndex)
                    wallpaperGrid.positionViewAtIndex(currentIndex, GridView.Contain)
                }
                event.accepted = true
                break
            case Qt.Key_Up:
                var newIndex = currentIndex - Math.floor(wallpaperGrid.width / wallpaperGrid.cellWidth)
                if (newIndex >= 0) {
                    currentIndex = newIndex
                    animateSelection(prevIndex, currentIndex)
                    wallpaperGrid.positionViewAtIndex(currentIndex, GridView.Contain)
                }
                event.accepted = true
                break
            case Qt.Key_Down:
                var newIndex = currentIndex + Math.floor(wallpaperGrid.width / wallpaperGrid.cellWidth)
                if (newIndex < wallpaperGrid.count) {
                    currentIndex = newIndex
                    animateSelection(prevIndex, currentIndex)
                    wallpaperGrid.positionViewAtIndex(currentIndex, GridView.Contain)
                }
                event.accepted = true
                break
            case Qt.Key_Return:
            case Qt.Key_Enter:
                if (currentIndex >= 0 && currentIndex < wallpaperGrid.count) {
                    Data.WallpaperManager.setWallpaper(Data.WallpaperManager.wallpaperList[currentIndex])
                }
                event.accepted = true
                break
        }
    }

    function animateSelection(prevIndex, newIndex) {
        // Reset previous item scale
        if (prevIndex >= 0) {
            var prevItem = wallpaperGrid.itemAtIndex(prevIndex)
            if (prevItem) {
                prevItem.children[0].scale = 1.0
            }
        }

        // Animate new selection
        if (newIndex >= 0) {
            var newItem = wallpaperGrid.itemAtIndex(newIndex)
            if (newItem) {
                newItem.children[0].scale = 1.08
                selectionResetTimer.restart()
            }
        }
    }

    Timer {
        id: selectionResetTimer
        interval: 300
        onTriggered: {
            if (currentIndex >= 0) {
                var item = wallpaperGrid.itemAtIndex(currentIndex)
                if (item) item.children[0].scale = 1.05
            }
        }
    }

    MouseArea {
        id: wallpaperSelectorMouseArea
        anchors.fill: parent
        hoverEnabled: true
        preventStealing: true
        propagateComposedEvents: true
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        clip: true

        ScrollBar.vertical.policy: ScrollBar.AsNeeded
        ScrollBar.vertical.interactive: true
        ScrollBar.vertical.minimumSize: 0.4

        property bool containsMouse: gridMouseArea.containsMouse

        MouseArea {
            id: gridMouseArea
            anchors.fill: parent
            hoverEnabled: true
            propagateComposedEvents: true
        }

        GridView {
            id: wallpaperGrid
            anchors.fill: parent
            cellWidth: parent.width / 3 - 5
            cellHeight: cellWidth * 0.8
            model: Data.WallpaperManager.wallpaperList
            cacheBuffer: 0
            leftMargin: 4
            rightMargin: 4
            topMargin: 4
            bottomMargin: 4

            delegate: Item {
                width: wallpaperGrid.cellWidth - 8
                height: wallpaperGrid.cellHeight - 8

                Rectangle {
                    id: wallpaperItem
                    anchors.fill: parent
                    anchors.margins: 4
                    color: Qt.darker(Data.ThemeManager.bgColor, 1.2)
                    radius: 10
                    scale: index === root.currentIndex ? 1.05 : 1.0

                    Behavior on scale {
                        NumberAnimation {
                            duration: 150
                            easing.type: Easing.OutBack
                            easing.overshoot: 1.2
                        }
                    }

                    Rectangle {
                        visible: index === root.currentIndex && root.activeFocus
                        anchors.fill: parent
                        radius: parent.radius
                        color: Data.ThemeManager.accentColor
                        opacity: 0.3
                    }

                    Image {
                        id: wallpaperImage
                        anchors.fill: parent
                        anchors.margins: 4
                        source: modelData
                        fillMode: Image.PreserveAspectCrop
                        asynchronous: true
                        cache: false
                        sourceSize.width: Math.min(width, 150)
                        sourceSize.height: Math.min(height, 90)

                        visible: parent.parent.y >= wallpaperGrid.contentY - parent.parent.height &&
                                parent.parent.y <= wallpaperGrid.contentY + wallpaperGrid.height
                    }

                    Rectangle {
                        visible: modelData === Data.WallpaperManager.currentWallpaper
                        anchors.fill: parent
                        radius: parent.radius
                        color: "transparent"
                        border.color: Data.ThemeManager.accentColor
                        border.width: 2
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            wallpaperItem.scale = 1.05
                            root.currentIndex = index
                        }
                        onExited: {
                            if (root.currentIndex === index && !root.activeFocus) {
                                wallpaperItem.scale = 1.0
                            }
                        }
                        onClicked: {
                            Data.WallpaperManager.setWallpaper(modelData)
                            root.currentIndex = index
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        Data.WallpaperManager.ensureWallpapersLoaded()
        forceActiveFocus()
    }
}
