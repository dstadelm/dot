#!/bin/bash
#set -x
EXTENSION=${1##*.}
echo $EXTENSION > ~/extension.txt
UNOCONV_EXTENSIONS=(vsdm vsdx vsd doc docx ppt pptx)
PDF_EXTENSIONS=(pdf)
XLSX_EXTENSIONS=(xlsx xls)
CSV_EXTENSIONS=(csv)

if [[ " ${UNOCONV_EXTENSIONS[@]} " =~ " ${EXTENSION} " ]]; then
  unoconv-pdf-diff $1 $2
elif [[ " ${PDF_EXTENSIONS[@]} " =~ " ${EXTENSION} " ]]; then
  diffpdf $1 $2
elif [[ " ${XLSX_EXTENSIONS[@]} " =~ " ${EXTENSION} " ]]; then
  FILE1=$(tempfile --suffix "$(basename "${1}").csv") || exit
  trap "rm -f -- ${FILE1}" exit
  FILE2=$(tempfile --suffix "$(basename "${2}").csv") || exit
  trap "rm -f -- ${FILE1} ${FILE2}" exit
  unoconv -f csv -o ${FILE1} ${1}
  unoconv -f csv -o ${FILE2} ${2}
  csv-diff ${FILE1} ${FILE2}
elif [[ " ${XLSX_EXTENSIONS[@]} " =~ " ${EXTENSION} " ]]; then
  csvdiff $1 $2
else
  meld $1 $2
fi
