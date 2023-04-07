file(WRITE ${OUTPUT_FILE} "Short:        ${SHORT}\n")
file(APPEND ${OUTPUT_FILE} "Author:       ${AUTHOR}\n")
file(APPEND ${OUTPUT_FILE} "Uploader:     ${UPLOADER}\n")
file(APPEND ${OUTPUT_FILE} "Type:         ${TYPE}\n")
file(APPEND ${OUTPUT_FILE} "Architecture: ${ARCH}\n")
file(APPEND ${OUTPUT_FILE} "\n")

file(READ ${SOURCE_FILE} README_CONTENT)

file(APPEND ${OUTPUT_FILE} "${README_CONTENT}\n")
