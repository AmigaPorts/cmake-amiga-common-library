# Copyright © 2020 Michal Schulz <michal.schulz@gmx.de>
# https://github.com/michalsc
#
# This Source Code Form is subject to the terms of the
# Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed
# with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

function(sfdc SFD_FILE)
    
    get_filename_component(LIB_NAME_FULL ${SFD_FILE} NAME_WLE)
    string(REGEX REPLACE "_lib$" "" LIB_NAME ${LIB_NAME_FULL})

    add_custom_command(
        OUTPUT includes/clib/${LIB_NAME}_protos.h
        COMMAND sfdc ${CMAKE_CURRENT_SOURCE_DIR}/${SFD_FILE} --mode=clib 
                     --output=includes/clib/${LIB_NAME}_protos.h
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${SFD_FILE}
        VERBATIM
    )

    add_custom_command(
        OUTPUT includes/pragmas/${LIB_NAME}_pragmas.h
        COMMAND sfdc ${CMAKE_CURRENT_SOURCE_DIR}/${SFD_FILE} --mode=pragmas
                     --output=includes/pragmas/${LIB_NAME}_pragmas.h
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${SFD_FILE}
        VERBATIM
    )

    add_custom_command(
        OUTPUT includes/proto/${LIB_NAME}.h
        COMMAND sfdc ${CMAKE_CURRENT_SOURCE_DIR}/${SFD_FILE} --mode=proto
                     --output=includes/proto/${LIB_NAME}.h
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${SFD_FILE}
        VERBATIM
    )

    add_custom_command(
        OUTPUT includes/inline/${LIB_NAME}.h
        COMMAND sfdc ${CMAKE_CURRENT_SOURCE_DIR}/${SFD_FILE} --mode=macros
                     --output=includes/inline/${LIB_NAME}.h
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${SFD_FILE}
        VERBATIM
    )

    add_library(${LIB_NAME} INTERFACE
        includes/clib/${LIB_NAME}_protos.h
        includes/pragmas/${LIB_NAME}_pragmas.h
        includes/proto/${LIB_NAME}.h
        includes/inline/${LIB_NAME}.h
    )
    target_include_directories(${LIB_NAME} INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/includes)

endfunction(sfdc)
