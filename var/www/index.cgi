#!/bin/sh

export PATH=/bin:/sbin:/usr/bin:/usr/sbin

echo "Content-type: text/html"
echo ""

cat theme/header.html
cat theme/leftmenu.html

echo "<div id=\"main\">"
# Parsing GET request (page)
PAGE=$(echo $QUERY_STRING | cut -d'=' -f2)
case $PAGE in
	"diskinfo") source scripts/diskinfo.sh ;;
	"sysinfo") source scripts/sysinfo.sh ;;
	"firmware") source scripts/firmware.sh ;;
	"syslog") source scripts/syslog.sh ;;
	"shell") source scripts/shell.sh ;;
	*) echo "<h1>Welcome to recovery console! $p</h1>" ;;
esac

echo "</div>"
cat theme/footer.html

exit 0