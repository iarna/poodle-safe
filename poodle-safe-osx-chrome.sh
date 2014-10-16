#!/bin/bash
set -e -o pipefail
CHROME="${1-/Applications/Google Chrome.app}"
EXEC="$CHROME/Contents/MacOS/Google Chrome"
POODLED="$CHROME/Contents/MacOS/Google Chrome Poodled"

if [ -f "$POODLED" ]; then
	echo "You already made your chrome poodle-safe" 1>&2
	exit 1
fi

mv "$EXEC" "$POODLED"

cat << EOF > "$EXEC"
#!/bin/sh
exec "\$0 Poodled" --ssl-version-min=tls1 "\$@"
EOF

chmod a+rx "$EXEC"

echo "Your Chrome is now poodle safe. Please quit and relaunch it."
echo "You'll need to approve Google Chrome Poodled for keychain access."
