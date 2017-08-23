# Used scan method of String class 
# http://ruby-doc.org/core-2.4.1/String.html#method-i-scan

def substrings(str, dict)
  rez = {}
  dict.each do |substr|
    str.downcase!
    n = str.scan(substr).size
    rez[substr] = n  if n > 0
  end
  rez
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)
