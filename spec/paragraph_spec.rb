require 'spec_helper'

describe "Paragraph" do
  it "starts whenever you see a block of text preceded and succeeded by a blank line" do
    expect(RubyMark.new("\n\nThis is a paragraph.\n\n").to_html).to match(/<p>This is a paragraph.<\/p>/)
  end
  
  it "doesn't start if there is already an html tag starting on that line" do
    expect(RubyMark.new("\n\n<div>This is not a paragraph.</div>\n\n").to_html).not_to match(/<p>.*<\/p>/)
  end
  
  it "can be followed by other paragraphs" do
    expect(RubyMark.new("\n\nThis is a paragraph.\n\nThis is another paragraph.\n\nAnd another.\n\n").to_html).to match(/<p>This is a paragraph.<\/p>\n\n<p>This is another paragraph.<\/p>\n\n<p>And another.<\/p>/)
  end
end