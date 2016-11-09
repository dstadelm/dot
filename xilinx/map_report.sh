#/bin/bash

usage(){
cat <<EOF
usage: $0 <options>
 This script can transform a map report in an easy reading form for resource estimations.
 For a good excel export use: -b 2 -e 2
 The script generates an easy.mrp as well as an easy_excel_import.csv 
 Each level contains the ressources of the level it self as well as all
 the ressources at the following levels.

OPTIONS:
-h           Show this message
-i <FILE>    Map-report (.mrp) input
-b <Depth>   At which level do you want to begin (Top level = 1)
-e <Depth>   At which level do you want to end
EOF
}

DEPTH_BEGIN=
DEPTH_END=
FILE=

while getopts "hi:b:e:" OPTION
do
  case $OPTION in
      h) usage
	 exit 1
	 ;;
      i)
	 FILE=$OPTARG
	 ;;
      b)
	 DEPTH_BEGIN=$OPTARG
	 ;;
      e)
	 DEPTH_END=$OPTARG
	 ;;
      ?)
	 usage
	 exit
	 ;;
  esac
done

if [[ -z $FILE ]] || [[ -z $DEPTH_BEGIN ]] || [[ -z $DEPTH_END ]]
then
    usage
    exit 1
fi

grep -i  "| Module" $FILE > easy.mrp
grep -iE " \+{$DEPTH_BEGIN,$DEPTH_END}[a-z]" $FILE >> easy.mrp
cp easy.mrp easy_excel_import.csv
sed -i 's/^|//g' easy_excel_import.csv 
sed -i 's/|/;/g' easy_excel_import.csv
#sed -i 's/[0-9]*\///g' easy_excel_import.csv