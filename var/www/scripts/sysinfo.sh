#!/bin/sh

echo "<h1>System info</h1>"
echo "<b>Uptime:</b> `uptime`<br>"
echo "<b>Uname -a:</b> `uname -a`<br>"
echo "<b>Memory and swap usage:</b> <pre><code>`free`</code></pre>"
echo "<b>Environment variables:</b> <pre><code>`env`</code></pre>"
echo "<b>CPU Info:</b> <pre><code>`cat /proc/cpuinfo`</code></pre>"
