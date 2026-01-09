pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import QMLTermWidget
import QtQuick.Controls.Universal
import UniQmlTk

BaseWindow {
    id: root
    width: 1280
    height: 1280
    visible: true

    disableSystemThemeManager: true

    Component.onCompleted: {
        root.Universal.theme = Universal.Dark;
    }

    Action {
        onTriggered: terminal.copyClipboard()
        shortcut: "Ctrl+Shift+C"
    }

    Action {
        onTriggered: terminal.pasteClipboard()
        shortcut: "Ctrl+Shift+V"
    }

    Action {
        onTriggered: searchButton.visible = !searchButton.visible
        shortcut: "Ctrl+F"
    }

    Action {
        onTriggered: {
            console.log('open new terminal window in:' + mainsession.currentDir);
        }
        shortcut: "Ctrl+Shift+T"
    }

    mainContent: RowLayout {
        anchors.fill: parent
        Item {
            width: 20
        }
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            QMLTermWidget {
                id: terminal
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.family: "JetBrainsMono Nerd Font"
                font.pointSize: 12
                colorScheme: "cool-retro-term"
                session: QMLTermSession {
                    id: mainsession
                    initialWorkingDirectory: "$HOME"
                    onMatchFound: {
                        console.log("found at: %1 %2 %3 %4".arg(startColumn).arg(startLine).arg(endColumn).arg(endLine));
                    }
                    onNoMatchFound: {
                        console.log("not found");
                    }
                }
                onTerminalUsesMouseChanged: console.log(terminalUsesMouse)
                onTerminalSizeChanged: console.log(terminalSize)
                Component.onCompleted: {
                    mainsession.startShellProgram();
                    forceActiveFocus();
                }

                QMLTermScrollbar {
                    terminal: terminal
                    width: 20
                    Rectangle {
                        opacity: 0.4
                        anchors.margins: 5
                        radius: width * 0.5
                        anchors.fill: parent
                    }
                }
            }

            Item {
                height: 20
            }
        }

        Item {
            width: 20
        }
    }
}
