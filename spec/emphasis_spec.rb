require 'spec_helper'

describe "Emphasis" do
  it "is between *s" do
    expect(RubyMark.new("*Emphasis*").to_html).to match(/<em>Emphasis<\/em>/)
  end
  
  it "is between _s" do
    expect(RubyMark.new("_Emphasis_").to_html).to match(/<em>Emphasis<\/em>/)
  end

  it "is strong between **s" do
    expect(RubyMark.new("**I am strong!**").to_html).to match(/<strong>I am strong!<\/strong>/)
  end
  
  it "is strong between __s" do
    expect(RubyMark.new("__I am strong!__").to_html).to match(/<strong>I am strong!<\/strong>/)
  end
  
  it "is not present when a _ is surrounded by spaces" do
    expect(RubyMark.new("This _ underscores _ the point").to_html).to match(/This _ underscores _ the point/)
  end

  it "is not present when a * is surrounded by spaces" do
    expect(RubyMark.new("This * stars * the point").to_html).to match(/This \* stars \* the point/)
  end

  it "is not present when a _ is escaped" do
    expect(RubyMark.new("This \\_underscores\\_ the point").to_html).to match(/This _underscores_ the point/)
  end

  it "is not present when a * is escaped" do
    expect(RubyMark.new("This \\*stars\\* the point").to_html).to match(/This \*stars\* the point/)
  end
end