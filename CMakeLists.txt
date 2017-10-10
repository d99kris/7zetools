# Project
cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(7zetools VERSION 1.0)

# Utilities
configure_file(src/7zcd ${CMAKE_CURRENT_BINARY_DIR}/7zcd COPYONLY)
install(PROGRAMS src/7zcd DESTINATION bin)

configure_file(src/7zdec ${CMAKE_CURRENT_BINARY_DIR}/7zdec COPYONLY)
install(PROGRAMS src/7zdec DESTINATION bin)

configure_file(src/7zenc ${CMAKE_CURRENT_BINARY_DIR}/7zenc COPYONLY)
install(PROGRAMS src/7zenc DESTINATION bin)

configure_file(src/7zopen ${CMAKE_CURRENT_BINARY_DIR}/7zopen COPYONLY)
install(PROGRAMS src/7zopen DESTINATION bin)

configure_file(src/7zpass ${CMAKE_CURRENT_BINARY_DIR}/7zpass COPYONLY)
install(PROGRAMS src/7zpass DESTINATION bin)

# Manuals
install(FILES src/7zcd.1 DESTINATION share/man/man1)
install(FILES src/7zdec.1 DESTINATION share/man/man1)
install(FILES src/7zenc.1 DESTINATION share/man/man1)
install(FILES src/7zopen.1 DESTINATION share/man/man1)
install(FILES src/7zpass.1 DESTINATION share/man/man1)

# Tests
enable_testing()

configure_file(tests/test001 ${CMAKE_CURRENT_BINARY_DIR}/test001 COPYONLY)
add_test(test001 "${PROJECT_BINARY_DIR}/test001")

configure_file(tests/test002 ${CMAKE_CURRENT_BINARY_DIR}/test002 COPYONLY)
add_test(test002 "${PROJECT_BINARY_DIR}/test002")

configure_file(tests/test003 ${CMAKE_CURRENT_BINARY_DIR}/test003 COPYONLY)
add_test(test003 "${PROJECT_BINARY_DIR}/test003")

configure_file(tests/test004 ${CMAKE_CURRENT_BINARY_DIR}/test004 COPYONLY)
add_test(test004 "${PROJECT_BINARY_DIR}/test004")

configure_file(tests/test005 ${CMAKE_CURRENT_BINARY_DIR}/test005 COPYONLY)
add_test(test005 "${PROJECT_BINARY_DIR}/test005")
