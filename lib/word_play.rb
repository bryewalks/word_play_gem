require "word_play/version"
require "thor"

module WordPlay
  class Error < StandardError; end
  class CLI < Thor

    desc "reverse STRING", "reverses input string"
    def reverse(input_string)
      reverse_string = ""
      index = -1
      input_string.length.times do
        reverse_string += input_string[index]
        index -= 1
      end
      puts reverse_string

      # puts input_string.reverse
    end

    desc "reverse_words STRING", "reverses words of input string"
    def reverse_words(input_string)
      word_array = input_string.split(' ')
      reverse_array = []
      index = -1
      word_array.length.times do
        reverse_array << word_array[index]
        index -= 1
      end
      puts reverse_array.join(' ')

      # puts input_string.split(' ').reverse.join(' ')
    end

    desc "palindrome? STRING", "returns true if palindrome"
    def palindrome?(input_string)
      reverse_string = ""
      index = -1
      input_string.length.times do
        reverse_string += input_string[index]
        index -= 1
      end
      puts reverse_string == input_string
      
      # puts input_string.reverse == input_string
    end

    desc "pig_latin STRING", "converts input string into pig latin"
    def pig_latin(input_string)
      word_array = input_string.split(' ')
      word_array.map! do |word|
        if /[aeiouAEIOU]/ =~ word[0]
          word += 'way'
        else
          first_letter = word.slice!(0)
          word += "#{first_letter}ay"
        end
      end
      puts word_array.join(' ')
    end

    desc "word_count STRING", "number of words in input string"
    def word_count(input_string)
      puts input_string.split.length
    end

    desc "word_frequency STRING", "counts frequency of each input word"
    def word_frequency(input_string)
      word_hash = {}
      input_string.split(' ').each do |word|
        word_hash[word] ? word_hash[word] += 1 : word_hash[word] = 1
      end
      word_hash.each do |k,v|
        puts "#{k}: #{v}"
      end
    end

    desc "character_count STRING", "number of characters in input string"
    def character_count(input_string)
      puts input_string.length
    end

    desc "character_frequency STRING", "counts frequency of each input character"
    def character_frequency(input_string)
      char_hash = {}
      input_string.each_char do |char|
        char_hash[char] ? char_hash[char] += 1 : char_hash[char] = 1
      end
      char_hash.each do |k,v|
        puts "#{k}: #{v}"
      end
    end

    desc "vowel_count STRING", "number of vowels in input string"
    def vowel_count(input_string)
      count = 0
      input_string.each_char{ |char| count += 1 if /[aeiouAEIOU]/ =~ char}
      puts count
    end

    desc "vowel_frequency STRING", "counts frequency of each input vowel"
    def vowel_frequency(input_string)
      vowel_hash = {}
      input_string.each_char do |char|
        if /[aeiouAEIOU]/ =~ char
          vowel_hash[char] ? vowel_hash[char] += 1 : vowel_hash[char] = 1
        end
      end
      vowel_hash.each do |k,v|
        puts "#{k}: #{v}"
      end
    end
  end
end
