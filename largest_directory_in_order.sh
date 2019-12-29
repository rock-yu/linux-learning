# -n will sort by numeric order
# pipe results into head to limit result to 10

du  -s /usr/share/* | sort -nr | head
