require 'spec_helper'

describe "Unordered List" do
  it "starts whenever you see a blank line followed by a line starting with *" do
    expect(RubyMark.new("\n\n* List Item").to_html).to match(/^<ul>\n.*List Item.*/)
  end

  it "has an element whenever a new line starts with a *" do
    expect(RubyMark.new("* List Item").to_html).to eq("<li>List Item</li>")
  end
  
  it "ends whenever a line that starts with a * is followed by a blank line" do
    expect(RubyMark.new("* List Item\n\n").to_html).to match(/.*List Item.*\n<\/ul>/)
  end
end

describe "Ordered List" do
  it "starts whenever you see a blank line followed by a line starting with \d." do
    expect(RubyMark.new("\n\n12. List Item").to_html).to match(/^<ol>\n.*List Item.*/)
  end

  it "has an element whenever a new line starts with a *" do
    expect(RubyMark.new("14. List Item").to_html).to eq("<li>List Item</li>")
  end
  
  it "ends whenever a line that starts with a * is followed by a blank line" do
    expect(RubyMark.new("1. List Item\n\n").to_html).to match(/.*List Item.*\n<\/ol>/)
  end
end