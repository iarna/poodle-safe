This approach works great, except that there are tools (*ahem* 1Password 4)
that check app signatures and refuse to work without them.  Which means we
can't monkey patch our apps without disabling those features. =(

Make your OSX Chrome Poodle Safe in one easy step:

```sh
curl https://raw.githubusercontent.com/iarna/poodle-safe/master/poodle-safe-osx-chrome.sh | bash
```

If you want to take it back, just run the command above a second time.

For more details on 1Password 4's signature verification feature:

https://guides.agilebits.com/kb/1password4/en/topic/browser-code-signature-validation?process_bundle_id=com.google.Chrome

(They have instructions on disabling it too.)
