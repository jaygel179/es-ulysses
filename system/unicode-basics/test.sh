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

function md5sumFile() {
  cat "$1" | md5sum -b | awk '{ print $1 }'
}

function challenge() {
  name=$1
  infile=$2
  inencoding=$3
  outfile=$4
  outencoding=$5
  expected_md5=$6

  echo -en "Challenge: \033[0;34m$name\033[0m … "
  OUTPUT=$($SCRIPT $infile $inencoding $outfile $outencoding 2>&1)
  if [[ $(md5sumFile "$outfile") == "$expected_md5" ]]; then
    ok
  else
    fail
    echo "Output: $OUTPUT"
  fi

}

echo "Testing $SCRIPT"

# Text
challenge "Diego" diego utf-32 diego-result utf-16 "20363f46d11bd45a31495b0d1dd5786d"
challenge "Squidward" squidward utf-8 squidward-result utf-8 "268b2a8cfe826b3433c92f2457edd173"
challenge "Wanderer" wanderer utf-16 wanderer-result utf-16 "2b7e9ad1716a27b8556e688869545a93"
