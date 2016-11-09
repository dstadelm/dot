#!/usr/bin/env bash

SOURCE_PATH=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
source ${SOURCE_PATH}/my_var.sh

function print {
  echo ${BLA}
  echo ${BLA}
  echo ${BLA}
  echo ${BLA}
  echo ${BLA}
  echo ${BLA}
}


print
print
print
print

