#!/bin/sh

echo "<h1>System logs</h1>"

echo "<b>Last system messages:</b>"
echo "<pre><code>`tail -n 25 /var/log/messages 2>&1`</code></pre>"

echo "<b>Dmesg last output:</b>"
echo "<pre><code>`dmesg | tail -n 25`</code></pre>"
