SIZE=+50M

find ~ -type f -size $SIZE -exec ls -lh '{}' 2>/dev/null ';' 
