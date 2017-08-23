def bubble_sort_by(arr)
  (0...arr.size-1).each do |i|
    (0...arr.size-i-1).each do |j|
      n = yield(arr[j], arr[j+1])
      arr[j], arr[j+1] = arr[j+1], arr[j] if n > 0
    end
  end
  arr
end

p bubble_sort_by(["hi","hello","hey"]) { |left, right| left.length - right.length }
  
