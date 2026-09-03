// SPDX-License-Identifier: GPL-3.0-only

import QtQuick
import QtQuick.VirtualKeyboard
import QtQuick.VirtualKeyboard.Components

Key {
    required property var modifierState
    property int modifier: Qt.NoModifier

    // Modifier buttons only alter the one-shot state. Normal keys are handled by
    // Qt Virtual Keyboard unless a modifier is latched.
    noKeyEvent: modifier !== Qt.NoModifier || modifierState.latched !== Qt.NoModifier
    highlighted: modifier !== Qt.NoModifier && (modifierState.latched & modifier) !== 0

    onClicked: {
        if (modifier !== Qt.NoModifier) {
            modifierState.toggle(modifier)
            return
        }

        if (modifierState.latched === Qt.NoModifier) {
            return
        }

        const modifiers = modifierState.latched
            | (uppercased ? Qt.ShiftModifier : Qt.NoModifier)

        // An empty text string deliberately requests a key event instead of a
        // text commit. The plasma-keyboard backend forwards it with the XKB
        // modifier state through input-method-v1.
        InputContext.inputEngine.virtualKeyClick(key, "", modifiers)
        modifierState.clear()
    }
}
