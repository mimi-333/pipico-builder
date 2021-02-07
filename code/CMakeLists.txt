cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(test_project)

pico_sdk_init()

add_executable(code code.c)

pico_enable_stdio_usb(code 1)

pico_enable_stdio_uart(code 1)

pico_add_extra_outputs(code)

target_link_libraries(code pico_stdlib)