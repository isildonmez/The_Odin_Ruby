def caesar_cipher(str, step)
  ciphered = ''
  str.each_char do |letter|
    letter = letter.ord
    if (65..90) === letter
      letter = 65 + (letter - 65 + step) % 26
    elsif (97..122) === letter
      letter = 97 + (letter - 97 + step) % 26
    end
    ciphered += letter.chr
  end
  ciphered
end

puts caesar_cipher("What a string!", 5)
puts caesar_cipher("What a string!", 5) == "Bmfy f xywnsl!"