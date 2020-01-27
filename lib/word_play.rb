require "word_play/version"
require "thor"

class WordPlay
  def reverse(input_string)
    input_string.reverse
  end

  def reverse_words(input_string)
    input_string.split(' ').reverse.join(' ')
  end

  def palindrome?(input_string)
    input_string.reverse == input_string
  end

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
    word_array.join(' ')
  end

  def word_count(input_string)
    input_string.split.length
  end

  def word_frequency(input_string)
    word_hash = {}
    input_string.split(' ').each do |word|
      word_hash[word] ? word_hash[word] += 1 : word_hash[word] = 1
    end
    word_hash
  end

  def character_count(input_string)
    input_string.length
  end

  def character_frequency(input_string)
    char_hash = {}
    input_string.gsub(/\s+/, "").each_char do |char|
      char_hash[char] ? char_hash[char] += 1 : char_hash[char] = 1
    end
    char_hash
  end

  def vowel_count(input_string)
    count = 0
    input_string.each_char{ |char| count += 1 if /[aeiouAEIOU]/ =~ char}
    count
  end

  def vowel_frequency(input_string)
    vowel_hash = {}
    input_string.each_char do |char|
      if /[aeiouAEIOU]/ =~ char
        vowel_hash[char] ? vowel_hash[char] += 1 : vowel_hash[char] = 1
      end
    end
    vowel_hash
  end

  def display_hash(input_hash)
    input_hash.each do |k,v|
      puts "#{k}: #{v}"
    end
  end

  class Error < StandardError; end
  class CLI < Thor

    desc "reverse STRING", "reverses input string"
    def reverse(input_string)
      puts WordPlay.new.reverse(input_string)
    end

    desc "reverse_words STRING", "reverses words of input string"
    def reverse_words(input_string)
      puts WordPlay.new.reverse_words(input_string)
    end

    desc "palindrome? STRING", "returns true if palindrome"
    def palindrome?(input_string)
      puts WordPlay.new.palindrome?(input_string)
    end

    desc "pig_latin STRING", "converts input string into pig latin"
    def pig_latin(input_string)
      puts WordPlay.new.pig_latin(input_string)
    end

    desc "word_count STRING", "number of words in input string"
    def word_count(input_string)
      puts WordPlay.new.word_count(input_string)
    end

    desc "word_frequency STRING", "counts frequency of each input word"
    def word_frequency(input_string)
      word_play = WordPlay.new
      word_frequency = word_play.word_frequency(input_string)
      word_play.display_hash(word_frequency)
    end

    desc "character_count STRING", "number of characters in input string"
    def character_count(input_string)
      puts WordPlay.new.character_count(input_string)
    end

    desc "character_frequency STRING", "counts frequency of each input character"
    def character_frequency(input_string)
      word_play = WordPlay.new
      character_frequency = word_play.character_frequency(input_string)
      word_play.display_hash(character_frequency)
    end

    desc "vowel_count STRING", "number of vowels in input string"
    def vowel_count(input_string)
      puts WordPlay.new.vowel_count(input_string)
    end

    desc "vowel_frequency STRING", "counts frequency of each input vowel"
    def vowel_frequency(input_string)
      word_play = WordPlay.new
      vowel_frequency = word_play.vowel_frequency(input_string)
      word_play.display_hash(vowel_frequency)
    end
  end
end
