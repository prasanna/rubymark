require 'spec_helper'

describe "Heading" do
  def i_hashes(i)
    "#" * i
  end
  
  (1..6).each do |i|
    describe "level #{i}" do
      it "is parsed and rendered correctly when it doesn't end with a hash" do
        expect(RubyMark.new("#{i_hashes(i)} Heading #{i}").to_html).to match("<h#{i}>Heading #{i}</h#{i}>")
      end

      it "is parsed and rendered correctly when it ends with a hash" do
        expect(RubyMark.new("#{i_hashes(i)} Heading #{i} #{i_hashes(i)}").to_html).to match("<h#{i}>Heading #{i}</h#{i}>")
      end
    end
  end
end