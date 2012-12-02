# RemoveCookie
A command line utility for OS X to remove Safari cookies for a specified domain.

**[Download Link][]**

## Usage

    removecoookie example.com

**Note:** RemoveCookie is pretty dumb. It deletes all cookies with a domain ending in whatever string you provide. So `removecookie example.com` deletes cookies for `example.com` and all subdomains of `example.com` (<i>i.e.</i> `blog.example.com, beta.example.com` and so on). This also means that `removecookie com` will delete *any cookie for all `.com` domains, so be careful (thankfully, not a lot of harm can come from deleting cookies — the worst you'll likely experience is losing the contents of a shopping cart or having to log in to a site again).

## Compatibility
I've done virtually no testing. It works for me on OS X 10.7.5 with Safari 6.0.2. It should work with most recent versions of Safari on OS X 10.7 and 10.8. It will likely work with 10.6 (and possibly earlier), but you may need to change the build settings in Xcode.

RemoveCookie is provided as-is with no warranty or guarantee of any kind. You're free to use or modify it however you like for non-commercial use. If you come up with any useful or interesting modifications, feel free to submit a pull request.

[download link]: https://github.com/downloads/robmathers/RemoveCookie/removecookie-1.0.zip
