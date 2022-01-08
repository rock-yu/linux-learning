# Use 'find' to search under current directory for files larger than 50M
# 1) Tests: -type, -size
# 2) User-defined Actions: -exec command {} ;   
# where {} is a symbolic representation of the current pathname, and the semicolon is a required delimiter indicating the end of the command.
# Because the brace and semicolon have special meaning to the shell, they must be auoted or escaped
SIZE=+50M && find . -type f -size $SIZE -exec ls -lh '{}' 2>/dev/null ';'


# Delete large files interactively with "-ok" action
# SIZE=+500M && find . -type f -size $SIZE -ok rm '{}' ';'
