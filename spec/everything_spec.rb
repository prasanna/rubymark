require 'spec_helper'
require 'nokogiri'
require 'great_expectations'

describe "Markdown Document" do
  extend GreatExpectations
    
  great_expectations.each do |great, expectation|
    it "#{great} is/are parsed correctly in its entirity" do
      expect(RubyMark.new(expectation[:md]).to_html).to eq(expectation[:html])
    end
  end
end

