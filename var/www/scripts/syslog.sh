#!/bin/sh

echo "<h1>System logs</h1>"

echo "<b>Last system messages:</b>"
echo "<pre>`tail /var/log/messages 2>&1`</pre>"

echo "<b>Dmesg last output:</b>"
echo "<pre>`dmesg | tail`</pre>"
