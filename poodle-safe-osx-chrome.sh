#!/bin/bash
set -e -o pipefail
CHROME="${1-/Applications/Google Chrome.app}"
EXEC="$CHROME/Contents/MacOS/Google Chrome"
POODLED="$CHROME/Contents/MacOS/Google Chrome Poodled"

function poodle() {
    cat << EOF > "$EXEC"
#!/bin/sh
exec "\$0 Poodled" --ssl-version-min=tls1 "\$@"
EOF
}

if [ -f "$POODLED" ]; then
	if grep -q poodle-safe-osx-chrome.sh "$EXEC"; then
		echo "I made your chrome bad, sorry about that! =( Fixing it!"
		poodle
		exit 0
	fi
	echo "You already made your chrome poodle-safe" 1>&2
	exit 1
fi

mv "$EXEC" "$POODLED"

poodle

chmod a+rx "$EXEC"

echo "Your Chrome is now poodle safe. Please quit and relaunch it."
echo "You'll need to approve Google Chrome Poodled for keychain access."
