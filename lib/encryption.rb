def encrypt (string, offset)
  letterhash = { "A" => 0 + offset, "B" => 1 + offset, "C" => 2 + offset, "D" => 3 + offset, "E" => 4 + offset, "F" => 5 + offset,
                 "G" => 6 + offset, "H" => 7 + offset, "I" => 8 + offset, "J" => 9 + offset, "K" => 10 + offset, "L" => 11 + offset,
                 "M" => 12 + offset, "N" => 13 + offset, "O" => 14 + offset, "P" => 15 + offset, "Q" => 16 + offset, "R" => 17 + offset,
                 "S" => 18 + offset, "T" => 19 + offset, "U" => 20 + offset, "V" => 21 + offset, "W" => 22 + offset, "X" => 23 + offset,
                 "Y" => 24 + offset, "Z" => 25 + offset, "a" => 26 + offset, "b" => 27 + offset, "c" => 28 + offset, "d" => 29 + offset,
                 "e" => 30 + offset, "f" => 31 + offset, "g" => 32 + offset, "h" => 33 + offset, "i" => 34 + offset, "j" => 35 + offset,
                 "k" => 36 + offset, "l" => 37 + offset, "m" => 38 + offset, "n" => 39 + offset, "o" => 40 + offset, "p" => 41 + offset,
                 "q" => 42 + offset, "r" => 43 + offset, "s" => 44 + offset, "t" => 45 + offset, "u" => 46 + offset, "v" => 47 + offset,
                 "w" => 48 + offset, "x" => 49 + offset, "y" => 50 + offset, "z" => 51 + offset}
  alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y",
              "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
              "y", "z"]
  list = string.split("") #separating the string into a list
  encrypted = []

  if string == "" #exceptionhandling
    return raise ArgumentError, "String must not be empty"
  elsif offset == 0
    return raise ArgumentError, "Offset must not be zero"
  end

  list.each do |object|
    if object != " " #skips if the object is empty space
      object = letterhash[object] #replace each letter in the list with a number, determined by the hash and offset
      if object > 25 && alphabet[object-offset] == alphabet[object-offset].upcase #if the object is uppercase
        object = 0 + (object - 26) #handles numbers that don't correspond to a letter, i.e starting over from the beginning of the alphabet
      elsif object > 51 && alphabet[object-offset] != alphabet[object-offset].upcase #if the object is lowercase
        object = 26 + (object - 52)
      end
      object = alphabet[object] #replaces the number with the corresponding letter in the alphabet
      encrypted << object
    else
      encrypted << object
    end
  end
  encrypted = encrypted.join("") #joins the now encrypted list into a string
  return encrypted.upcase! #i wrote the program with usability for both upper- and lowercase in mind so this is just a quick fix to meet the test requirements.
end

def decrypt (string, offset)
  letterhash = { "A" => 0 - offset, "B" => 1 - offset, "C" => 2 - offset, "D" => 3 - offset, "E" => 4 - offset, "F" => 5 - offset,
                 "G" => 6 - offset, "H" => 7 - offset, "I" => 8 - offset, "J" => 9 - offset, "K" => 10 - offset, "L" => 11 - offset,
                 "M" => 12 - offset, "N" => 13 - offset, "O" => 14 - offset, "P" => 15 - offset, "Q" => 16 - offset, "R" => 17 - offset,
                 "S" => 18 - offset, "T" => 19 - offset, "U" => 20 - offset, "V" => 21 - offset, "W" => 22 - offset, "X" => 23 - offset,
                 "Y" => 24 - offset, "Z" => 25 - offset, "a" => 26 - offset, "b" => 27 - offset, "c" => 28 - offset, "d" => 29 - offset,
                 "e" => 30 - offset, "f" => 31 - offset, "g" => 32 - offset, "h" => 33 - offset, "i" => 34 - offset, "j" => 35 - offset,
                 "k" => 36 - offset, "l" => 37 - offset, "m" => 38 - offset, "n" => 39 - offset, "o" => 40 - offset, "p" => 41 - offset,
                 "q" => 42 - offset, "r" => 43 - offset, "s" => 44 - offset, "t" => 45 - offset, "u" => 46 - offset, "v" => 47 - offset,
                 "w" => 48 - offset, "x" => 49 - offset, "y" => 50 - offset, "z" => 51 - offset} #inverted the offset
  alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y",
              "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
              "y", "z"]
  list = string.split("")
  decrypted = []

  if string == ""
    return raise ArgumentError, "String must not be empty"
  elsif offset == 0
    return raise ArgumentError, "Offset must not be zero"
  end

  list.each do |object|
    if object != " "
      object = letterhash[object]
      if object > 25 && alphabet[object+offset] == alphabet[object+offset].upcase #inverted the offset
        object = 0 + (object - 26)
      elsif object > 51 && alphabet[object+offset] != alphabet[object+offset].upcase #inverted the offset
        object = 26 + (object - 52)
      end
      object = alphabet[object]
      decrypted << object
    else
      decrypted << object
    end
  end
  decrypted = decrypted.join("")
  return decrypted.downcase! #decrypt function is basically an inverted encrypt function
end