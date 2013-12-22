require 'spec_helper'

describe "Block Quote" do
  it "is between empty lines and start with '> '" do
    expect(RubyMark.new("").blockquotes("\n\n> This is a block quote\n\n")).to match(/^\n\n<blockquote><p>\nThis is a block quote\n<\/p><\/blockquote>\n\n/)
    expect(RubyMark.new("\n\n> This is a block quote\n\n").to_html).to match(/^\n\n<blockquote><p>\nThis is a block quote\n<\/p><\/blockquote>\n\n/)
  end
  
  it "can be more than one paragraph long" do
    # expect(RubyMark.new("").blockquotes("\n\n> This is a para in a block quote\nLine 2.\n\n> And this is the second para.\n\n")).to match(/^<blockquote>This is a para in a block quote\nLine 2.<\/blockquote>\n\n<blockquote>And this is the second para.<\/blockquote>/)
    expect(RubyMark.new("\n\n> This is a para in a block quote\nLine 2.\n\n> And this is the second para.\n\n").to_html).to match(/^<blockquote><p>\nThis is a para in a block quote\nLine 2.<\/p>\n\n<p>And this is the second para.\n<\/p><\/blockquote>/)
  end
  
  it "can be made of many lines that start with '> '" do
    expect(RubyMark.new("").blockquotes("\n\n> This is a line in a block quote\n> And so is this.\n\n")).to match(/^<blockquote><p>\nThis is a line in a block quote\nAnd so is this.\n<\/p><\/blockquote>/)
  end
  
  it "can exist more than once in a document" do
    expect(RubyMark.new("").blockquotes("\n\n> This is a line in a block quote\n> And so is this.\n\nSome other stuff here.\n\n> Another block quote\n\n")).to eq("\n\n<blockquote><p>\nThis is a line in a block quote\nAnd so is this.\n</p></blockquote>\n\nSome other stuff here.\n\n<blockquote><p>\nAnother block quote\n</p></blockquote>\n\n")
    expect(RubyMark.new("\n\n> This is a line in a block quote\n> And so is this.\n\nSome other stuff here.\n\n> Another block quote\n\n").to_html).to match(/^<blockquote><p>\nThis is a line in a block quote\nAnd so is this.\n<\/p><\/blockquote>\n\n<p>Some other stuff here.<\/p>\n\n<blockquote><p>\nAnother block quote\n<\/p><\/blockquote>\n\n/)
  end
end