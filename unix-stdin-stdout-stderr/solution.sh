#!/usr/bin/env bash

read line && echo $line && echo $(($line + 1)) >&2
