cmake_minimum_required(VERSION 3.16)

project(UniTerminal VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 REQUIRED COMPONENTS Core DBus Widgets Quick QuickControls2)
find_package(UniQmlTk REQUIRED)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appUniTerminal
    main.cpp
)

qt_add_qml_module(appUniTerminal
    URI UniTerminal
    QML_FILES
        Main.qml
)

target_include_directories(appUniTerminal PUBLIC
    /usr/include/unisettings
)

target_link_libraries(appUniTerminal
    PRIVATE
    Qt::Core
    Qt::DBus
    Qt::Widgets
    Qt::Quick
    Qt::QuickControls2
    UniQmlTk unisettings
)

target_link_libraries(appUniTerminal
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appUniTerminal
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
