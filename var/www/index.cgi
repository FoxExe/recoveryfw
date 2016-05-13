#!/bin/sh

echo "Content-type: text/html"
echo ""

# Print header
cat theme/header.html

# Print menu items
echo "<div id=\"menu\"><ul>
	<li><a href=\"?p=main\">Main menu</a></li>
	<li><a href=\"?p=diskinfo\">Disk info</a></li>
	<li><a href=\"?p=sysinfo\">System info</a></li>
	<li><a href=\"?p=firmware\">Firmware tools</a></li>
	<li><a href=\"?p=syslog\">System log</a></li>
	<li><a href=\"?p=shell\">Simple shell</a></li>
</ul></div>"

# Print page
echo "<div id=\"main\">"
PAGE=$(echo $QUERY_STRING | cut -d'=' -f2)
if [ "$PAGE" == '' ]; then
	source scripts/main.sh
else
	PAGE_FOUND=0
	for file in scripts/*.sh
	do
		if [ "$(echo $file | cut -d '/' -f 2 | cut -d '.' -f 1)" == "$PAGE" ]; then
			source scripts/$PAGE.sh
			PAGE_FOUND=1
			break
		fi
	done
	if [ "$PAGE_FOUND" == "0" ]; then
		echo "<h1>Sorry, page \"$PAGE\" not found (404)</h1>"
	fi
fi
echo "</div>"

# Print footer
cat theme/footer.html

exit 0