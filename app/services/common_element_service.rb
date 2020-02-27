class CommonElementService

  def initialize arr1, arr2
    @arr1 = arr1
    @arr2 = arr2
  end

  def perform
    common_arr = []
    hash1 = @arr1.map{ |e| [e, true] }.to_h
    
    @arr2.each{ |e| common_arr << e if hash1[e] }

    common_arr.uniq
  end
end
