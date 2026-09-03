// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.VirtualKeyboard
import QtQuick.VirtualKeyboard.Components
import QtQuick.Layouts

KeyboardLayout {
    id: layout

    property int latched: Qt.NoModifier

    function toggle(modifier) {
        latched = latched ^ modifier
    }

    function clear() {
        latched = Qt.NoModifier
    }

    KeyboardRow {
        StickyKey {
            modifierState: layout
            key: Qt.Key_Escape
            text: ""
            displayText: "Esc"
            functionKey: true
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Tab
            text: ""
            displayText: "Tab"
            functionKey: true
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Control
            text: ""
            displayText: "Ctrl"
            functionKey: true
            modifier: Qt.ControlModifier
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Alt
            text: ""
            displayText: "Alt"
            functionKey: true
            modifier: Qt.AltModifier
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Left
            text: ""
            displayText: "←"
            functionKey: true
            repeat: true
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Up
            text: ""
            displayText: "↑"
            functionKey: true
            repeat: true
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Down
            text: ""
            displayText: "↓"
            functionKey: true
            repeat: true
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Right
            text: ""
            displayText: "→"
            functionKey: true
            repeat: true
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Delete
            text: ""
            displayText: "Del"
            functionKey: true
            repeat: true
        }
    }
    inputMode: InputEngine.InputMode.Latin
    keyWeight: 160
    readonly property real normalKeyWidth: normalKey.width
    readonly property real functionKeyWidth: mapFromItem(normalKey, normalKey.width, 0).x
    KeyboardRow {
        StickyKey {
            modifierState: layout
            key: Qt.Key_Q
            text: "q"
        }
        StickyKey {
            modifierState: layout
            id: normalKey
            key: Qt.Key_W
            text: "w"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_E
            text: "e"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_R
            text: "r"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_T
            text: "t"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Z
            text: "z"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_U
            text: "u"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_I
            text: "i"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_O
            text: "o"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_P
            text: "p"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Udiaeresis
            text: "ü"
        }
    }
    KeyboardRow {
        StickyKey {
            modifierState: layout
            key: Qt.Key_A
            text: "a"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_S
            text: "s"
            alternativeKeys: "sß"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_D
            text: "d"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_F
            text: "f"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_G
            text: "g"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_H
            text: "h"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_J
            text: "j"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_K
            text: "k"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_L
            text: "l"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Odiaeresis
            text: "ö"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Adiaeresis
            text: "ä"
        }
    }
    KeyboardRow {
        KeyboardRow {
            Layout.preferredWidth: functionKeyWidth
            Layout.fillWidth: false
            ShiftKey {
                weight: 240
            }
            FillerKey {
                weight: 80
            }
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Y
            text: "y"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_X
            text: "x"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_C
            text: "c"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_V
            text: "v"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_B
            text: "b"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_N
            text: "n"
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_M
            text: "m"
        }
        KeyboardRow {
            Layout.preferredWidth: functionKeyWidth
            Layout.fillWidth: false
            FillerKey {
                weight: 80
            }
            BackspaceKey {
                weight: 240
            }
        }
    }
    KeyboardRow {
        SymbolModeKey {
            weight: functionKeyWidth
            Layout.fillWidth: false
        }
        ChangeLanguageKey {
            weight: normalKeyWidth
            Layout.fillWidth: false
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Comma
            weight: normalKeyWidth
            Layout.fillWidth: false
            text: ","
            smallText: "\u2699"
            smallTextVisible: keyboard.isFunctionPopupListAvailable()
            highlighted: true
        }
        SpaceKey {
        }
        StickyKey {
            modifierState: layout
            key: Qt.Key_Period
            weight: normalKeyWidth
            Layout.fillWidth: false
            text: "."
            alternativeKeys: "!.?"
            smallText: "!?"
            smallTextVisible: true
            highlighted: true
        }
        HideKeyboardKey {
            weight: normalKeyWidth
            Layout.fillWidth: false
        }
        EnterKey {
            weight: functionKeyWidth
            Layout.fillWidth: false
        }
    }
}
