cmake_minimum_required(VERSION 3.10.0)

# Running cppcheck
find_program(CMAKE_CXX_CPPCHECK NAMES cppcheck)
if (CMAKE_CXX_CPPCHECK)
    set(CPP_CHECK_CMD ${CMAKE_CXX_CPPCHECK} --version)
    
    execute_process(COMMAND ${CPP_CHECK_CMD}
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    RESULT_VARIABLE CPP_CHECK_RESULT
    OUTPUT_VARIABLE CPP_CHECK_VERSION
    ERROR_VARIABLE CPP_CHECK_ERROR)
    
    list(
        APPEND CMAKE_CXX_CPPCHECK 
            "--enable=style,performance,warning,portability"
            "--inline-suppr"
            "--suppress=cppcheckError"
            "--suppress=internalAstError"
            "--suppress=unmatchedSuppression"
            "--suppress=passedByValue"
            "--suppress=syntaxError"
            "--inconclusive"
    )

    add_custom_target(cppcheck 
        COMMAND ${CMAKE_CXX_CPPCHECK}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    )
endif()