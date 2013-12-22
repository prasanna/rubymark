require 'spec_helper'
require 'nokogiri'
require 'great_expectations'

describe "Markdown Document" do
  include_context "GreatExpectations"
  
  it "is parsed correctly in its entirity" do
    great_expectations.each do |great, expectation|
      expect(RubyMark.new(expectation[:md]).to_html).to eq(expectation[:html])
#      expect(Nokogiri::HTML(RubyMark.new(expectation[:md]).to_html).to_s).to eq(Nokogiri::HTML(expectation[:html]).to_s)
    end
  end
end

