cmake_minimum_required(VERSION 3.20)
project(3_test)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)


find_package(Qt5 COMPONENTS
        Core
        Gui
        Widgets
        REQUIRED)

add_executable(3_test main.cpp)
target_link_libraries(3_test
        Qt5::Core
        Qt5::Gui
        Qt5::Widgets
        )

