require "word_play/version"
require "thor"

module WordPlay
  class Error < StandardError; end
  class CLI < Thor

    desc "reverse", "reverses input string"
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

    desc "reverse_words", "reverses words of input string"
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

    desc "palindrome?", "returns true if palindrome"
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
  end
end
