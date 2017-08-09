add_library (palindrome palindrome.c)
target_include_directories (palindrome PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
install(TARGETS palindrome
        ARCHIVE DESTINATION lib)
