#!/bin/sh

echo "<h1>Firmware tools</h1>"

# Empty previous uploaded file
cat > tmp/uploaded
cat > tmp/normalfile

# Read any input if present
while read -r -s DATA
do
	echo "$DATA" >> tmp/uploaded
done

sed '1,4d' tmp/uploaded | sed '$d' > tmp/normalfile
cat > tmp/uploaded

FILEINFO=`md5sum tmp/normalfile`
echo "<b>MD5 hash of uploaded file:</b>$FILEINFO<br>"

#TODO: 
# 1. Untar file
# 2. Search md5 file
# 3. Compare md5 to files inside (List of md5 hashes)
# 4. Start installing
# 5. Show log in console (using js file for update info in <pre> block)

echo "<form method=\"post\" action=\"?p=firmware\" enctype=\"multipart/form-data\">
	<input type=\"file\" name=\"file\" id=\"file\">
	<input type=\"submit\" value=\"Upload & install\">
</form>"

echo "<b>Install log</b><br>"
echo "<pre id=\"fwinstallog\">`cat tmp/fwinstalllog`</pre>"
