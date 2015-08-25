#!/usr/bin/env bash

#
#----Settings
#
PATH_EXEC="$1"



#
#----Constants
#
readonly GENERIC_EXIT_VAL='33'

readonly FAILURE_CHARACTER=✘



#
#----Functions
#
function fail() {
  echo -e "\033[1;31m" "${FAILURE_CHARACTER}" "\033[0m"
  if [ "x${1}" == "x" ]; then
    exit "$GENERIC_EXIT_VAL"
  fi

  exit "$1"
}

function ok() {
  echo -e "\033[0;32m" "✔" "\033[0m"
}



#
#----Execution
#

# 1)
echo -e "I. \e[1mPiping numbers thru stdin, expecting them on stdout as is\e[0m"
for INPUT1 in 1 2 3 4 5; do
  OUTPUT1=$(echo $INPUT1 | $PATH_EXEC 2>/dev/null)
  echo -en " • [$INPUT1] -> [$OUTPUT1] =>"

  if [ "$OUTPUT1" == "$INPUT1" ];then
    ok
  else
    fail 1
  fi
done


# 2)
echo -e "II. \e[1mPiping numbers thru stdin, expecting them on stderr increased by 1\e[0m"
for INPUT1 in 1 2 3 4 5; do
  OUTPUT1=$(echo $INPUT1 | $PATH_EXEC 2>&1 1>/dev/null)
  echo -en " • [$INPUT1] -> [$OUTPUT1] =>"

  if (( "$OUTPUT1" == "$INPUT1" + 1 ));then
    ok
  else
    fail 1
  fi
done


