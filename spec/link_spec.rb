require 'spec_helper'

describe "Link" do
  it "looks like this: [an example](http://example.com/ \"Title\")" do
    expect(RubyMark.new("[an example](http://example.com/ \"Title\")").to_html)
       .to match(/<a href="http:\/\/example.com\/" title="Title">an example<\/a>/)
  end

  it "could look like this: [an example](http://example.com/)" do
    expect(RubyMark.new("[an example](http://example.com/)").to_html)
       .to match(/<a href="http:\/\/example.com\/">an example<\/a>/)
  end

end