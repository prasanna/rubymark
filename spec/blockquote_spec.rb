require 'spec_helper'

describe "Block Quote" do
  it "is between empty lines and start with '> '" do
    expect(RubyMark.new("\n\n> This is a block quote\n\n").to_html).to match(/^\n\n<blockquote>This is a block quote<\/blockquote>\n\n/)
  end

  it "can be more than one paragraph long" do
    expect(RubyMark.new("\n\n> This is a para in a block quote\n\n> And this is the second para.\n\n").to_html).to match(/^<blockquote>This is a para in a block quote<\/blockquote>\n\n<blockquote>And this is the second para.<\/blockquote>/)
  end

  it "can be made of many lines that start with '> '" do
    expect(RubyMark.new("\n\n> This is a line in a block quote\n> And so is this.\n\n").to_html).to match(/^<blockquote>This is a line in a block quote\nAnd so is this.<\/blockquote>/)
  end
end