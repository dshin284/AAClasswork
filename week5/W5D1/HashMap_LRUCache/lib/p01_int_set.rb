class MaxIntSet
  attr_reader :store, :max

  def initialize(max)
    @store = Array.new(max,false)
  end

  def insert(num)
    validate!(num)
    return false if @store[num]
    store[num] = true
  end

  def remove(num)
    #Validate errors.
    validate!(num)
    return nil if !include?(num)
    store[num] = false
    return num
  end

  def include?(num)
    #use the content to output true or false.
    validate!(num)
    return store[num]
  end

  private

  def is_valid?(num)
    return num >= 0 && num <= store.length - 1 ? true : false
  end

  def validate!(num)
    raise "Out of bounds" if !is_valid?(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    # return false if include?(num) 
    # self[num] << num
    # return num

    #store = 
    #[[],
    # [],
    # [],
    # [],
    # [],
    # ..
    #   ]
    #Mod the num // store[bucket_num] << num if store[bucket_num].include?(num)
    bucket_num = num % 20
    raise "Number already exists" if store[bucket_num].include?(num)
    if !store[bucket_num].include?(num) 
      store[bucket_num] << num
    end
  end

  def remove(num)
    bucket_num = num % 20
    if store[bucket_num].include?(num)
       store[bucket_num].delete(num)
    end
  end

  def include?(num)
    bucket_num = num % 20
    return !store[bucket_num].include?(num) ? false : true
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store, :num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = store.length
    @count = 0
  end

  def insert(num)
    if @count > store.size
      resize! 
      bucket_num = num % store.size
      if !store[bucket_num].include?(num)
        store[bucket_num] << num 
        @count += 1
      end
    else
      bucket_num = num % store.size
      if !store[bucket_num].include?(num)
        store[bucket_num] << num 
        @count += 1
      end
    end
    
  end

  def remove(num)
    bucket_num = num % store.length
    if store[bucket_num].include?(num)
       store[bucket_num].delete(num)
       @count -= 1
    end
  end

  def include?(num)
    bucket_num = num % store.length
    return !store[bucket_num].include?(num) ? false : true
  end

  def inspect()
      #check to see
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`

    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # self.count = 0
    # old_array = self.store
    # new_array = Array.new(num_buckets * 2) {Array.new }
    # old_array.each_with_index do |subArr,idx|
    #   new_bucket_idx = idx % new_array.length 
    #   new_array[new_bucket_idx] = old_array[idx] 
    # end
    # self.store = new_array
    # return self.store
    old_store = self.store
    self.count = 0
    p num_buckets
    self.store = Array.new(num_buckets * 2) {Array.new}
    
  end

end


