cmake_minimum_required(VERSION 3.20)
project(FFWorksClassic LANGUAGES CXX)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/arm/o.le-v7-g")

add_executable(FFWorksClassic src/main.cpp)
target_link_libraries(FFWorksClassic PRIVATE bbcascades QtDeclarative QtCore)
