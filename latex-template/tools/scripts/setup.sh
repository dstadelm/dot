SOURCE_PATH=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
source $SOURCE_PATH/checkSuccess.sh
BASE_PATH=${SOURCE_PATH%%/tools/scripts}

################################################################################
# script execution stack
checkAndLink () {
[ ! -L $(basename "$1") ] && ln -s "$1" .
}

checkAndLink "${BASE_PATH}/scs"
checkAndLink "${BASE_PATH}/scs.sty"
checkAndLink "${SOURCE_PATH}/generate_documentation.sh"
#
################################################################################
