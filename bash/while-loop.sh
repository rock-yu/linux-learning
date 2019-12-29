#!/bin/bash

echo "Enter a five-digit ZIP code: "

read ZIP

# The –v option is used to return a value if the pattern is not found
# Why the > /dev/null 2>&1? Because we don’t want to display anything from the 
# egrep command, just make use of its true/false return value

while echo $ZIP | egrep -v "^[0-9]{5}$" > /dev/null 2>&1

do

   echo "You must enter a valid ZIP code – five digits only!"

   echo "Enter a five-digit ZIP code: "

   read ZIP

done


echo "Thank you"
