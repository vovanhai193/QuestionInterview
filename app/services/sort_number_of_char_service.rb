class SortNumberOfCharService
  OPERATOR = {ASC: :>, DESC: :<}

  def initialize str, order_type
    @str = str
    @order_type = order_type
  end

  def perform
    hash = {}
    @str.each_char { |c| hash[c] = hash[c].to_i + 1 }

    bubble_sort_for_hash hash
  end

  private

  def bubble_sort_for_hash hash
    arr = hash.to_a
    len = arr.length
    for i in (0...len)
      swapped = false
      (0...(len - i - 1)).each do |j|
        if arr[j][1].public_send(OPERATOR[@order_type], arr[j+1][1])
          arr[j], arr[j+1] = arr[j+1], arr[j]
          swapped = true
        end
      end
      break unless swapped
    end
    return arr.to_h
  end
end
