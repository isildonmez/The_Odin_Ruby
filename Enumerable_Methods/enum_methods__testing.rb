require_relative 'enum_methods'

def multiply_els(arr)
  arr.my_inject { |memo, el| memo * el }
end

puts '', '---multiply_els---'
puts multiply_els([2,4,5])

arr = [3,4,6,3,7,2]
h ={a: "b", z: "x"}

puts '', '\n---my_each---'
p arr.my_each {|el| el**2}
p arr.my_each
h.my_each{|k, v| puts "h[#{k}] => #{v} "}
(1..5).my_each { |n| puts n**3 }

puts '', '\n---my_each_with_index---'
arr.my_each_with_index{ |a, i| puts "arr[#{i}] = #{a}" } 
p h.my_each_with_index

puts '', '---my_select---'
p arr.my_select{|a| a>3}
p arr.my_select
p h.my_select {|k, v| v == 'b'}

puts '', '---my_all?---'
p arr.my_all?{|a| a>1}
p arr.my_all?{|a| a>4}
p arr.my_all?
p h.my_all? {|k, v| v == 'b'}

puts '', '---my_any?---'
p arr.my_any?{|a| a>1}
p arr.my_any?{|a| a>4}
p arr.my_any?
p h.my_any? {|k, v| v == 'b'}

puts '', '---my_none?---'
p arr.my_none?{|a| a<1}
p arr.my_none?{|a| a>4}
p arr.my_none?
p h.my_none? {|k, v| v == 'b'}

puts '', '---my_count---'
p arr.my_count{|a| a<1}
p arr.my_count{|a| a>4}
p arr.my_count
p h.my_count {|k, v| v == 'b'}

puts '', '---my_map---'
p arr.my_map{|a| a<1 ? a**2 : a}
p arr.my_map{|a| a>4 ? a**2 : a}
p arr.my_map
p h.my_map {|k, v| v = v * 3}
p arr.my_map(Proc.new { |a| a**2 })

puts '', '---my_inject---'
p arr.my_inject{|memo, a| memo + a}
p arr.my_inject(100){|memo, a| memo + a}
p arr.my_inject
p h.my_inject('--') {|memo, a| memo + a[1]}