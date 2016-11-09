#!/bin/bash

ARRAY=()

if [[ ! -f "${1}" ]]; then
    echo "First argument has to be a file you want to split"
    exit 1
fi

pdftk "${1}" dump_data_utf8 | grep "BookmarkTitle:"  > bmtitle.dat
grep -n "BookmarkTitle:" bmtitle.dat   > bmtitle_ln.dat
pdftk "${1}" dump_data_utf8 | grep "BookmarkPageNumber:"  > bmpage.dat
grep -n "BookmarkPageNumber:" bmpage.dat > bmpage_ln.dat
join -1 1 -2 1 -t ":" bmpage_ln.dat bmtitle_ln.dat > bmjoined.dat

while read line;do
    index=$(echo $line | cut -f 3 -d ":" | sed 's/\([[:digit:]]\)/\1/g')
    filename=$(echo $line | cut -f 5 -d ":"  | sed 's/[[:punct:]]//g' |sed 's/\s\+/_/g' | sed 's/[(|)]//g' | sed 's/^_//g' | sed 's/_$//g')
    ARRAY[${index}]="${filename}.pdf"
done < bmjoined.dat

rm bmtitle.dat
rm bmpage.dat
rm bmtitle_ln.dat
rm bmpage_ln.dat
rm bmjoined.dat

for index in ${!ARRAY[*]}; do
    echo "Page ${index}: ${ARRAY[$index]}"
    pdftk "${1}" cat "${index}" output "${ARRAY[$index]}"
done

