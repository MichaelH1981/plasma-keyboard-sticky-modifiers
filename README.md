# Sticky Ctrl/Alt for Plasma Keyboard

This project adds one-shot Ctrl and Alt modifiers to KDE Plasma's Qt Virtual Keyboard based `plasma-keyboard`.

Tap `Ctrl`, then `C`, and the focused Wayland client receives a real Ctrl+C key combination. The same applies to Alt and to combined Ctrl+Alt. The modifier key remains highlighted until the following key and can be cancelled by tapping it again.

The implementation stays inside Plasma Keyboard's existing Qt/Wayland input-method path. It does not use `uinput`, `ydotool`, XTest, or another external key-injection service.

## Why a QML-only change is insufficient

Qt Virtual Keyboard exposes `InputContext.inputEngine.virtualKeyClick(key, text, modifiers)`, but Plasma Keyboard 6.7.4 normally commits textual keys as text. Its non-text key path also drops the Qt modifier mask before the event reaches KWin. A `Key { key: Qt.Key_Control }` in a layout therefore cannot produce a reliable Ctrl+letter sequence.

The small C++ patch converts the requested keysym to the active XKB/evdev keycode, sends the native modifier state with input-method-v1, forwards a raw press/release pair, and clears the modifier state afterward. `StickyKey.qml` implements the one-shot UI state.

## Tested platform

- Debian Forky
- KDE Plasma 6.7.4
- Qt 6.10.2
- Wayland / KWin
- `plasma-keyboard` Debian package 6.7.4-2
- Panasonic Toughpad FZ-M1 MK3

The Debian binary package built from this tree passed all upstream tests. Added compositor integration tests verify the native Ctrl+C and Alt+F sequences (`modifier mask → raw key press → raw key release → cleared mask`) with no text commit. Other Plasma/Qt versions need review and a rebuild against their matching private Qt ABI.

## KDE neon comparison

The official KDE neon Plasma 6.7.4 `plasma-keyboard` package contains the standard Qt Virtual Keyboard layouts and no separate Ctrl/Alt row. Neon also distributes Maliit; the additional modifier bar seen in some Neon setups is therefore most likely provided by that alternate keyboard backend, not by a hidden Plasma Keyboard layout patch. This repository keeps the installed Plasma Keyboard backend and fixes its modifier path directly.

## Building a Debian package

1. Obtain the exact Debian `plasma-keyboard` source matching the target system (`6.7.4-2` for the tested build).
2. Apply `plasma-keyboard-6.7.4-sticky-modifiers.patch` at the source root.
3. Copy `original/main.qml` and `original/StickyKey.qml` to `src/layouts/de_DE/`.
4. Add a local Debian changelog version, for example `6.7.4-2+fzmod1`.
5. Install the package build dependencies and run `dpkg-buildpackage -b -uc -us`.

Do not install a package built against a different Qt private ABI. Preserve the currently installed binary and layout before replacing them.

## Sources

- [KDE plasma-keyboard source](https://github.com/KDE/plasma-keyboard)
- [Qt Virtual Keyboard InputEngine](https://doc.qt.io/qt-6/qvirtualkeyboardinputengine.html)
- [Qt Virtual Keyboard InputContext](https://doc.qt.io/qt-6/qml-qtquick-virtualkeyboard-inputcontext.html)
- [Wayland input-method-v1 protocol](https://cgit.freedesktop.org/wayland/wayland-protocols/tree/unstable/input-method/input-method-unstable-v1.xml)
- [KDE neon Maliit package metadata](https://metadata.neon.kde.org/appstream/release_jammy/html/jammy/main/metainfo/maliit-keyboard.html)

## License and credit

The changes are released under GPL-3.0-only. Qt's original German layout retains its existing copyright and license header.

Designed, researched, implemented, packaged, and validated by OpenAI Codex.
