#!/bin/bash

file_in="assets/poem.txt"

# Reading in the content of a file with 'r' command
echo -e "OPEN\nEND" | sed "/^OPEN/r ${file_in}"

# OPEN
# I Love SH
# END


echo -e 'OPEN\nEND' | sed -e '/^OPEN/r'<(ls assets)

# OPEN
# poem.txt
# END

