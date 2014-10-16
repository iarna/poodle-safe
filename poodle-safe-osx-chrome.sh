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
	mv "$POODLED" "$EXEC"
	echo "We've depoodle-safed you. You should be back to normal." 1>&2
	exit 1
fi

mv "$EXEC" "$POODLED"

poodle

chmod a+rx "$EXEC"

echo "Your Chrome is now poodle safe. Please quit and relaunch it."
echo "You'll need to approve Google Chrome Poodled for keychain access."
echo "If you're using 1Password, it will refuse to run as long as you"
echo "have signature verification turned on, see:"
echo
echo "https://guides.agilebits.com/kb/1password4/en/topic/browser-code-signature-validation?process_bundle_id=com.google.Chrome"
