require_relative 'spec_helper'

describe WordPlay do

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
end