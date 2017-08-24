class Hash
  # Implementing of method #<< for hashs 
  # Uses in method #my_select
  def << (el)
    self[el[0]] = el[1]
  end
end


module Enumerable
 
  def my_each
    if block_given?
      for el in self
        yield(el)
      end
      self
    else
      to_enum(:my_each)  # If no block is given, an Enumerator is returned
    end
  end
  
  def my_each_with_index
    if block_given?
      i = 0
      self.my_each do |el|
        yield(el, i)
        i += 1
      end
      self
    else
      to_enum(:each_with_index)
    end
  end
  
  def my_select
    if block_given?
      selected = self.dup
      selected.clear
      self.my_each { |el| selected << (el) if yield(el) }
      selected
    else
      to_enum(:my_select)
    end
  end
  
  def my_all?
    if block_given?
      self.my_each { |el| return false unless yield(el) }
      true
    else
      to_enum(:my_all?)
    end
  end
  
  def my_any?
    if block_given?
      self.my_each { |el| return true if yield(el) }
      false
    else
      to_enum(:my_any?)
    end
  end
  
  def my_none?
    if block_given?
      self.my_each { |el| return false if yield(el) }
      true
    else
      to_enum(:my_none?)
    end
  end
  
  def my_count
    if block_given?
      n = 0
      self.my_each { |el| n += 1 if yield(el) }
      n
    else
      self.size
    end
  end
  
  #map { |obj| block } → array
  def my_map(my_proc = nil)
    mapped = []
    if my_proc
      self.my_each { |el| mapped << my_proc.call(el) }
      mapped
    elsif block_given?
      self.my_each { |el| mapped << yield(el) }
      mapped
    else
      to_enum(:my_map)
    end
  end
  
  # inject(initial) { |memo, obj| block } → obj
  # If initial value isn't specified explicitly for memo, 
  # the first element of collection is used as the initial value 
  # and skipped in iterations.
  def my_inject(memo = nil)
    if block_given?
      memo ? memo = yield(memo, self.first) : memo = self.first
      self.drop(1).my_each do |item|
        memo = yield(memo, item)
      end
      memo
    else
      to_enum(:my_inject)
    end
  end
  
end

# Try testing examples in the file 'enum_methods__testing.rb'
