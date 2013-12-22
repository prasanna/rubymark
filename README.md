# RubyMark

## What is it?

RubyMark is an experiment with Markdown. I just wanted to see if it is possible to convert Markdown into HTML in a very simple / naive way that can be unit-tested.

## How do I use it?

<code>
RubyMark.new("## Heading Two").to_html  
</code>

## Security

RubyMark is cryptographically signed. To be sure the gem you install hasn’t been tampered with:

Add my public key (if you haven’t already) as a trusted certificate

gem cert --add <(curl -Ls https://raw.github.com/prasanna/rubymark/master/certs/prasanna.pem)

gem install rubymark -P HighSecurity
