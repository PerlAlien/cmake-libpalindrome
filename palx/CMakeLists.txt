add_executable (palx main.c)
target_link_libraries (palx LINK_PUBLIC palindrome)
install(TARGETS palx
        RUNTIME DESTINATION bin)
