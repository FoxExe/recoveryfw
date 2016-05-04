#!/bin/sh

# Regex for parse disk partitions from parted:
# Note: WDMC don't have "extended" partitions, and "Flags".
# Found better way? Tell me!
# \s(\s|[0-9])\s{6}([0-9.]{4}[A-z]{2})\s{2}([0-9.]{4}[A-z]{2})\s{2}([0-9.]{4}[A-z]{2})\s{2}(\bprimary\b\s|\bextended\b|\blogical\b\s|\s{8})(\n|\s{2}(.*)\n)

for disk in /dev/sd?
do
	if [ -b $disk ]; then
		echo "<h1>Found $disk, info:</h1>"
		echo "<pre>`parted $disk --script "p q" 2>&1`</pre>"
	fi
done

echo "<hr>"
echo "<h1>Raid(s) status:</h1><pre>`cat /proc/mdstat 2>&1`</pre>"

echo "<hr>"
echo "<h1>Mount points and disk usage:</h1><pre>`df -h 2>&1`</pre>"
