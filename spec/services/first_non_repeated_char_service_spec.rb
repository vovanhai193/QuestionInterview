require 'rails_helper'

describe FirstNonRepeatedCharService do

  describe "str have non-repeated char" do
    let(:str) { "abcabcdeabc" }
    let(:service) { FirstNonRepeatedCharService.new(str) }

    it 'should return first non-repeated character' do
      first_non_repeated_char = "d"
      expect(service.perform).to eq first_non_repeated_char
    end
  end

  describe "str don't have non-repeated char" do
    let(:str) { "abcdabcd" }
    let(:service) { FirstNonRepeatedCharService.new(str) }

    it 'should return nil' do
      expect(service.perform).to eq nil
    end
  end
end
