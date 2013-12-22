require 'spec_helper'

describe "Header" do
  describe "level one" do
    it "is parsed and rendered correctly" do
      expect(RubyMark.new("# Heading One").to_html).to match("<h1>Heading One</h1>")
    end
  end

  describe "level two" do
    it "is parsed and rendered correctly" do
      expect(RubyMark.new("## Heading Two").to_html).to match("<h2>Heading Two</h2>")
    end
  end

  describe "level three" do
    it "is parsed and rendered correctly" do
      expect(RubyMark.new("### Heading Three").to_html).to match("<h3>Heading Three</h3>")
    end
  end

  describe "level four" do
    it "is parsed and rendered correctly" do
      expect(RubyMark.new("#### Heading Four").to_html).to match("<h4>Heading Four</h4>")
    end
  end
  
  describe "level five" do
    it "is parsed and rendered correctly" do
      expect(RubyMark.new("##### Heading Five").to_html).to match("<h5>Heading Five</h5>")
    end
  end
  
  describe "level six" do
    it "is parsed and rendered correctly" do
      expect(RubyMark.new("###### Heading Six").to_html).to match("<h6>Heading Six</h6>")
    end
  end
  
end