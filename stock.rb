def stock_picker(arr)	
  rez = [0, 0]
  arr[0..-2].each_with_index do |buy, i|
  	arr[i..-1].each do |sell|
  	  if sell - buy > arr[rez[1]] - arr[rez[0]]
  	  	rez[0] = i
  	  	rez[1] = arr.index(sell)
  	  end
  	end
  end
  rez
end

p stock_picker([17,3,6,9,15,8,6,1,10])
