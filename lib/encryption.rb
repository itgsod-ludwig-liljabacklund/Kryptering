def encrypt (string, offset)
  raise ArgumentError, "String must not be empty" if string.empty?
  raise ArgumentError, "Offset must not be zero" if offset == 0

  alphabet = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  encrypted = ""

  string.each_char do |character|
    if character != " " #skips if the object is empty space
      character = character.upcase
      if (alphabet.index(character) + offset) <= 25
        character = alphabet[alphabet.index(character) + offset] #replace each letter in the list with a number, determined by the hash and offset
      elsif (alphabet.index(character) + offset) > 25
        character = alphabet[(alphabet.index(character) + offset) - 26]
      end
    end
    encrypted += character
  end
  return encrypted
end

def decrypt (string, offset)
  return encrypt(string, offset * -1).downcase
end