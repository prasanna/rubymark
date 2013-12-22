require 'spec_helper'

describe "Emphasis" do
  it "is between *s" do
    expect(RubyMark.new("*Emphasis*").to_html).to match(/^<em>Emphasis<\/em>/)
  end
  
  it "is between _s" do
    expect(RubyMark.new("_Emphasis_").to_html).to match(/^<em>Emphasis<\/em>/)
  end

  it "is strong between **s" do
    expect(RubyMark.new("**I am strong!**").to_html).to match(/^<strong>I am strong!<\/strong>/)
  end
  
  it "is strong between __s" do
    expect(RubyMark.new("__I am strong!__").to_html).to match(/^<strong>I am strong!<\/strong>/)
  end
  
end