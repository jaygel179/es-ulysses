#!/bin/bash

readonly BINARY_SOLUTION_FILE=reversed.pdf
readonly FAILURE_CHARACTER=✘
readonly TEXT_SOLUTION='Awesome! You have mastered this challenge. All, hail the Beautiful Squidward!'

readonly SCRIPT="$*"


#
#----Functions
#
function fail() {
  echo -e "\033[1;31m" "${FAILURE_CHARACTER}" "\033[0m"
}

function ok() {
  echo -e "\033[0;32m" "✔" "\033[0m"
}


echo "Running $SCRIPT"
OUTPUT=$($SCRIPT)

# Text

echo -n "Text challenge … "
if [[ "$OUTPUT" == "$TEXT_SOLUTION" ]]; then
  ok
else
  fail
  echo "You produced: $OUTPUT"
fi

# Binary

echo -n "Binary challenge … "
if [[ ! -e "$BINARY_SOLUTION_FILE" ]]; then
  fail
  echo "Did not find $BINARY_SOLUTION_FILE"
else
  if [[ $(cat "$BINARY_SOLUTION_FILE" | md5sum -b | awk '{ print $1 }') == "ac92b40812c051a6f6fc839e43dd3e25" ]]; then
    ok
  else
    fail
  fi
fi
