require 'rails_helper'

describe CommonElementService do

  describe "2 array have common elements" do
    let(:arr1) { [3, 4, 6, 3, 7, 8, 5, 9] }
    let(:arr2) { [5, 4, 1, 2, 3] }
    let(:service) { CommonElementService.new(arr1, arr2) }

    it 'should return an common array' do
      common_arr = [5, 4, 3]
      expect(service.perform).to eq common_arr
    end
  end

  describe "2 array don't have common element" do
    let(:arr1) { [3, 4, 6] }
    let(:arr2) { [5, 2, 1] }
    let(:service) { CommonElementService.new(arr1, arr2) }

    it 'should return an empty array' do
      expect(service.perform).to eq []
    end
  end
end
