require 'rails_helper'

describe SortNumberOfCharService do
  let(:str) { "zyabcdabcac" }

  describe "sort asc" do
    let(:service) { SortNumberOfCharService.new(str, :ASC) }

    it 'should return an ascending hash' do
      asc_hash = {"z"=>1, "y"=>1, "d"=>1, "b"=>2, "a"=>3, "c"=>3}
      expect(service.perform).to eq asc_hash
    end
  end

  describe "sort desc" do
    let(:service) { SortNumberOfCharService.new(str, :DESC) }

    it 'should return an descending hash' do
      desc_hash = {"a"=>3, "c"=>3, "b"=>2, "z"=>1, "y"=>1, "d"=>1}
      expect(service.perform).to eq desc_hash
    end
  end
end
