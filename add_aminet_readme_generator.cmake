# Copyright © 2023 Marlon Beijer <marlon@amigadev.com>
# https://github.com/mbeijer
#
# This Source Code Form is subject to the terms of the
# Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed
# with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(AMINET_FUNCTIONS_DIR "${CMAKE_CURRENT_LIST_DIR}")

function(add_aminet_readme_generator TARGET_NAME OUTPUT_NAME)
	find_package(Git)

	execute_process(COMMAND ${GIT_EXECUTABLE} config --get user.name WORKING_DIRECTORY ${PROJECT_SOURCE_DIR} OUTPUT_VARIABLE GIT_USER_NAME OUTPUT_STRIP_TRAILING_WHITESPACE)
	execute_process(COMMAND ${GIT_EXECUTABLE} config --get user.email WORKING_DIRECTORY ${PROJECT_SOURCE_DIR} OUTPUT_VARIABLE GIT_USER_EMAIL OUTPUT_STRIP_TRAILING_WHITESPACE)
	set(AMINET_UPLOADER "${GIT_USER_EMAIL} (${GIT_USER_NAME})")

	add_custom_command(
		OUTPUT ${PROJECT_BINARY_DIR}/${OUTPUT_NAME}
		COMMAND ${CMAKE_COMMAND}
		-DSOURCE_FILE=${PROJECT_SOURCE_DIR}/README.md
		-DOUTPUT_FILE=${PROJECT_BINARY_DIR}/${OUTPUT_NAME}
		-DSHORT=${AMINET_SHORT}
		-DAUTHOR=${AMINET_AUTHOR}
		-DTYPE=${AMINET_TYPE}
		-DARCH=${AMINET_ARCH}
		-DUPLOADER=${AMINET_UPLOADER}
		-P "${AMINET_FUNCTIONS_DIR}/generate_aminet_readme.cmake"
		COMMENT "Generating Aminet readme file..."
		WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
		DEPENDS "${PROJECT_SOURCE_DIR}/README.md"
		VERBATIM
	)

	add_custom_target(aminet_readme DEPENDS ${PROJECT_BINARY_DIR}/${OUTPUT_NAME})
	add_dependencies(${TARGET_NAME} aminet_readme)

	install(FILES ${PROJECT_BINARY_DIR}/${OUTPUT_NAME} DESTINATION docs)

endfunction(add_aminet_readme_generator)
