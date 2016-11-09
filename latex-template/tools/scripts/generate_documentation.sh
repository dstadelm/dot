#!/bin/bash
SOURCE_PATH=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
source $SOURCE_PATH/checkSuccess.sh

###############################################################################
# Generate a default revision tex file
###############################################################################
function default_revision {
echo -e  "${YELLOW}Creating default version file as no git information was found which could be used to generate valid version information! ${OFF}${WARNING}"
user=$(echo ${USER:0:3} | tr '[:lower:]' '[:upper:]')
echo "\\revision{V.NoRevision}{$(date +%d-%h-%Y)}{$user}{No subject!}" > version.tex
}

###############################################################################
# Generate a revision tex file based on the git log
###############################################################################
function revision {
IS_GIT_DIR=$(git rev-parse --is-inside-work-tree 2>  /dev/null)
if [ "${IS_GIT_DIR}" == "true" ]; then
  docfiles=$(git ls-files | grep -e .tex -e .bib)
  git log --reverse --pretty="%h ; %an ; %s ; %ai" $docfiles > revision.log
  cat revision.log
  if [ $? -eq 0 ]; then
    checkSuccess $? "Reading GIT log"
    version=1
    if [ -f version.tex ]; then
      rm version.tex
    fi
    touch version.tex
    while read line
    do
      hash=$(echo $line | cut -f 1 -d ';')    # sed -r 's/((\s|\t|\w)*);.*/\1/g')
      author=$(echo $line | cut -f 2 -d ';')  # sed -r 's/((\s|\t|\w)*);((\s|\t|\w)*);.*/\3/g')
      initials=""
      for string in $author;do
        initials=$initials${string:0:1}
      done
      subject=$(echo $line | cut -f 3 -d ';') # sed -r 's/((\s|\t|\w)*);((\s|\t|\w)*);((\s|\t|\w)*);.*/\5/g')
      date=$(echo $line | cut -f 4 -d ';')
      date=$(echo $date | cut -f 1 -d ' ')
      echo "\\revision{V.$version ( hash : $hash)}{$date}{$initials}{$subject}" >> version.tex
      version=$(($version+1))
    done < revision.log
    if [ $(wc -l version.tex | cut -f 1 -d " ") -eq 0 ]; then
      default_revision
    fi
  else
    default_revision
  fi
else
  default_revision
fi
}

revision
latexmk -r "${SOURCE_PATH}/latexmkrc/commands.rc" -r "${SOURCE_PATH}/latexmkrc/glossaries.rc" "$@"
