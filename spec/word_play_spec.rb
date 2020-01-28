require_relative 'spec_helper'

describe WordPlay do

  let(:word_play) { WordPlay.new }

  describe "#reverse" do
    it "reverses input string" do
      expect(word_play.reverse("hello")).to eq("olleh")
    end
  end

  describe "#reverse_words" do
    it "reverses words of input string" do
      expect(word_play.reverse_words("hello there")).to eq("there hello")
    end
  end

  describe "#palindrome?" do
    it "returns true if palindrome" do
      expect(word_play.palindrome?("racecar")).to eq(true)
    end

    it "returns false if not palindrome" do
      expect(word_play.palindrome?("hello there")).to eq(false)
    end
  end

  describe "pig_latin" do
    it "converts string into pig latin" do
      expect(word_play.pig_latin("hello there")).to eq("ellohay heretay")
    end

    it "adds 'way' if first letter of word is a vowel" do
      expect(word_play.pig_latin("elephant")).to eq("elephantway")
    end
  end

  describe "#word_count" do
    it "counts total number of words" do
      expect(word_play.word_count("this is four words")).to eq(4)
    end
  end
  
  describe "#word_frequency" do
    it "counts frequency of each input word" do
      expect(word_play.word_frequency("hello hello hey hey hey")).to eq({"hello"=>2, "hey"=>3})
    end
  end

  describe "#character_count" do
    it "counts total number of characters" do
      expect(word_play.character_count("Alot of characters")).to eq(18)
    end
  end

  describe "#character_frequency" do
    it "counts frequency of each input character" do
      expect(word_play.character_frequency("hello")).to eq({"e"=>1, "h"=>1, "l"=>2, "o"=>1})
    end

    it "does not count white spaces" do
      expect(word_play.character_frequency("hello hello hey hey hey")).to eq({"e"=>5, "h"=>5, "l"=>4, "o"=>2, "y"=>3})
    end
  end

  describe "#vowel_count" do
    it "counts total number of vowels" do
      expect(word_play.vowel_count("how many vowels?")).to eq(4)
    end
  end

  describe "#vowel_frequency" do
    it "counts frequency of each input vowel" do
      expect(word_play.vowel_frequency("hello hello hey hey hey")).to eq({"e"=>5, "o"=>2})
    end
  end

  describe WordPlay::CLI do
    describe "#display_hash" do
      it "displays each key value of hash" do
        expect { WordPlay::CLI.new.display_hash({"hello": 1, "there": 1}) }.to output("hello: 1\nthere: 1\n").to_stdout
      end
    end
  end
end