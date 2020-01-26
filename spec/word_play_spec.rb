require_relative 'spec_helper'

describe WordPlay::CLI do

  let(:word_play) { WordPlay::CLI.new }

  describe "#reverse" do
    it "reverses input string" do
      expect { word_play.reverse("hello") }.to output("olleh\n").to_stdout
    end
  end

  describe "#reverse_words" do
    it "reverses words of input string" do
      expect { word_play.reverse_words("hello there") }.to output("there hello\n").to_stdout
    end
  end

  describe "#palindrome?" do
    it "returns true if palindrome" do
      expect { word_play.palindrome?("racecar") }.to output("true\n").to_stdout
    end

    it "returns false if not palindrome" do
      expect { word_play.palindrome?("hello there") }.to output("false\n").to_stdout
    end
  end

  describe "pig_latin" do
    it "converts string into pig latin" do
      expect { word_play.pig_latin("hello there") }.to output("ellohay heretay\n").to_stdout
    end

    it "adds 'way' if first letter of word is a vowel" do
      expect { word_play.pig_latin("elephant") }.to output("elephantway\n").to_stdout
    end
  end

  describe "#word_count" do
    it "counts total number of words" do
      expect { word_play.word_count("this is four words") }.to output("4\n").to_stdout
    end
  end
  
  describe "#word_frequency" do
    it "counts frequency of each input word" do
      expect { word_play.word_frequency("hello hello hey hey hey") }.to output("hello: 2\nhey: 3\n").to_stdout
    end
  end

  describe "#character_count" do
    it "counts total number of characters" do
      expect { word_play.character_count("Alot of characters") }.to output("18\n").to_stdout
    end
  end

  describe "#character_frequency" do
    it "counts frequency of each input character" do
      expect { word_play.character_frequency("hello hello hey hey hey") }.to output("h: 5\ne: 5\nl: 4\no: 2\n : 4\ny: 3\n").to_stdout
    end
  end

  describe "#vowel_count" do
    it "counts total number of vowels" do
      expect { word_play.vowel_count("how many vowels?") }.to output("4\n").to_stdout
    end
  end

  describe "#vowel_frequency" do
    it "counts frequency of each input vowel" do
      expect { word_play.vowel_frequency("hello hello hey hey hey") }.to output("e: 5\no: 2\n").to_stdout
    end
  end
end