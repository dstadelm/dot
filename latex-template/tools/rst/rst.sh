#!/bin/bash

function print_help {
    echo "Usage: $(basename $0) <INPUT>"
    exit 1
}
if [ ! $1 ]; then
    print_help
fi

SCRIPT=$(readlink $0)
REL_PATH_TO_SCRIPT=${SCRIPT%/*}

if [[ ! -f docinfo.tex ]]; then
    echo "ERROR: docinfo.tex not found."
    echo "   You may copy it from "${REL_PATH_TO_SCRIPT}"/docinfo.tex to your"
    echo "   working directory."
    exit -1
fi
if [[ ! -f skeleton.tex ]]; then
    ln -s ${REL_PATH_TO_SCRIPT}/skeleton.tex
fi
if [[ ! -f rst.tex ]]; then
    ln -s ${REL_PATH_TO_SCRIPT}/rst.tex
fi
if [[ ! -f scs.sty ]]; then
    ln -s ${REL_PATH_TO_SCRIPT}/scs.sty
fi
if [[ ! -f scs ]]; then
    ln -s ${REL_PATH_TO_SCRIPT}/scs
fi

rst2latex --template rst.tex $1 body.tex
pdflatex -halt-on-error skeleton.tex 
[[ ! $? -eq 0 ]] && exit 1
pdflatex -halt-on-error skeleton.tex 
[[ ! $? -eq 0 ]] && exit 1
mv skeleton.pdf ${1%.*}.pdf

rm *.aux *.log *.out *.toc *~
