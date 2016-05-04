#!/bin/sh

export PATH=/bin:/sbin:/usr/bin:/usr/sbin

# Associative arrays not supported... sad... :(
MENU_0="main=Main menu"
MENU_1="diskinfo=Disk info"
MENU_2="sysinfo=System info"
MENU_3="firmware=Firmware tools"
MENU_4="syslog=System log"
MENU_5="shell=Simple shell"

echo "Content-type: text/html"
echo ""

# Print header
cat theme/header.html

# Print menu items
echo "<div id=\"menu\"><ul>"
MENU_ITEMS=""
for i in 0 1 2 3 4 5
do
	url=$(eval echo $"MENU_$i" | cut -d'=' -f1)
	name=$(eval echo $"MENU_$i" | cut -d'=' -f2)
	MENU_ITEMS="$MENU_ITEMS $url"
	echo "<li><a href=\"?p=$url\">$name</a></li>"
done
echo "</ul></div>"

# Print asked page
echo "<div id=\"main\">"
PAGE=$(echo $QUERY_STRING | cut -d'=' -f2)
PAGE_FOUND=0
for item in $MENU_ITEMS
do
	if [ "$item" == "$PAGE" ]; then
		source scripts/$item.sh
		PAGE_FOUND=1
	fi
done
if [ "$PAGE_FOUND" == "0" ]
	source scripts/main.sh
fi
echo "</div>"

# Print footer
cat theme/footer.html

exit 0