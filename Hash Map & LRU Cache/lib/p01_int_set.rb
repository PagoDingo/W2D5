class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    if @store[num] == true
      return true
    else 
      false
    end

  end
                                                                                                                          
  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }

  end

  def insert(num) 
    unless include?(num)
      self[num] << num 
      num
    end
  end

  def remove(num)

      self[num].delete(num) 
    
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
  self.store[num%num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end  

  def insert(num)
    return fase if self[num].include?(num)


  end

  def remove(num)

  end

  def include?(num)
     self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % num_buckets] 
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = self.store
    self.count = 0
    self.store = Array.new(num_buckets * 2) { Array.new }

    old_store.flatten.each { |num| insert(num) }
    num
  end
end
