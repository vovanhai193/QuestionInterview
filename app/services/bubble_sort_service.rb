class BubbleSortService
  OPERATOR = {ASC: :>, DESC: :<}

  def initialize arr, order_type
    @arr = arr
    @order_type = order_type
  end

  def perform
    len = @arr.length
    for i in (0...len)
      swapped = false
      (0...(len - i - 1)).each do |j|
        if @arr[j].public_send(OPERATOR[@order_type], @arr[j+1])
          @arr[j], @arr[j+1] = @arr[j+1], @arr[j]
          swapped = true
        end
      end
      break unless swapped
    end
    return @arr
  end
end
