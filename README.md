# UniTerminal

UniTerminal is a minimal Qt/QML-based terminal emulator tailored for the Uni desktop environment, built on QMLTermWidget and UniQmlTk.

## Features

*terminal*

## Requirements

- Qt 6.8 or newer with components: Core, DBus, Widgets, Quick, QuickControls2.
- UniQmlTk and Uni settings headers (`/usr/include/unisettings`, linked as `unisettings`).
- QMLTermWidget/QMLTermScrollbar available in QML import path and JetBrainsMono Nerd Font installed for the intended appearance.


## Building

- Ensure Qt 6.8, UniQmlTk, UniSettings, and QMLTermWidget are installed and discoverable by CMake and QML.
- Configure and build:

```bash
mkdir build
cd build
cmake ..
cmake --build .
```

- Install the binary:

```bash
cmake --install build
```

This places the `appUniTerminal` runtime in your system’s standard `CMAKE_INSTALL_BINDIR`.

## Usage

Run the installed `appUniTerminal` binary from your launcher or terminal.[^2]


