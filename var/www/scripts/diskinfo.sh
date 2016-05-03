#!/bin/sh

echo "<h1>Disk #1:</h1>"
if [ -b /dev/sda ]; then
        echo "<pre>`parted /dev/sda --script "p q" 2>&1`</pre>"
else
        echo "<pre>Not present.</pre>"
fi

echo "<hr>"
echo "<h1>Disk #2:</h1>"
if [ -b /dev/sdb ]; then
        echo "<pre>`parted /dev/sdb --script "p q" 2>&1`</pre>"
else
        echo "<pre>Not present.</pre>"
fi

echo "<hr>"
echo "<h1>MD Raid status:</h1><pre>`cat /proc/mdstat 2>&1`</pre>"

echo "<hr>"
echo "<h1>Mount points and disk usage:</h1><pre>`df -h 2>&1`</pre>"
