#!/bin/sh

echo "<h1>System info</h1>"
echo "<b>Uptime:</b> `uptime`<br>"
echo "<b>Uname -a:</b> `uname -a`<br>"
echo "<b>Memory and swap usage:</b> <pre>`free`</pre>"
echo "<b>Environment variables:</b> <pre>`env`</pre>"
echo "<b>CPU Info:</b> <pre>`cat /proc/cpuinfo`</pre>"
