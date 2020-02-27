require 'rails_helper'

describe BubbleSortService do
  let(:arr) { [9,1,8,2,7,3,6,4,5,10,13] }

  describe "sort asc" do
    let(:service) { BubbleSortService.new(arr, :ASC) }

    it 'should return an ascending array' do
      asc_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 13]
      expect(service.perform).to eq asc_arr
    end
  end

  describe "sort desc" do
    let(:service) { BubbleSortService.new(arr, :DESC) }

    it 'should return an descending array' do
      desc_arr = [13, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
      expect(service.perform).to eq desc_arr
    end
  end
end
