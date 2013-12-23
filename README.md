# RubyMark

## What is it?

RubyMark is an experiment with Markdown. I just wanted to see if it is possible to convert Markdown into HTML in a very simple / naive way that can be unit-tested.

[![Gem Version](https://badge.fury.io/rb/rubymark.png)](http://badge.fury.io/rb/rubymark)


## How do I use it?

`RubyMark.new("## Heading Two").to_html`

## Security

RubyMark is cryptographically signed. To be sure the gem you install hasn’t been tampered with:

Add my public key (if you haven’t already) as a trusted certificate

`gem cert --add <(curl -Ls https://raw.github.com/prasanna/rubymark/master/certs/prasanna.pem)`

`gem install rubymark -P HighSecurity`

Checksums of released versions can be found [here](https://github.com/prasanna/rubymark/tree/master/checksum)