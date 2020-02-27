class FirstNonRepeatedCharService
  def initialize str
    @str = str
  end

  def perform
    hash = {}
    @str.each_char { |c| hash[c] = hash[c].to_i + 1 }
    
    hash.each do |k, v|
      return k if v == 1  
    end

    return nil
  end
end
