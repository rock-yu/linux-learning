#!/bin/bash

# An * matches zero or more of any character, a ? matches a single character, and you can use 
# square brackets to match a single character of a specific range.
# You can also use a | character to represent “or.”

read answer

case $answer in

y|ye[sp]) echo "you said yes";;

n|no|nope) echo "you said no";;

*)  echo "bad response";;

esac
