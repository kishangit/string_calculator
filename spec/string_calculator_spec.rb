require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe "#add" do
    let(:calculator) { StringCalculator.new }

    it "checks method exists or not" do
      expect( calculator.methods.include?(:add) ).to eq(true)
    end

    it "checks method accepts one argument" do
      expect { calculator.add }.to raise_error(ArgumentError)
    end

    it "handles that empty string input returns 0" do
      expect(calculator.add('')).to eq(0)
    end

    it "returns the number itself when only single number is given" do
      expect(calculator.add('100')).to eq(100)
    end

    it "checks output is Number when valid single number is passed" do
      expect(calculator.add('55').class).to eq(Integer)
    end

    it "returns the sum of two numbers" do
      expect(calculator.add('5,15')).to eq(20)
    end

    it "mocks that split is called when we have comma separated string as an input" do
      input = "10,20"
      expect(input).to receive(:split).and_return(['10','20'])
      expect(calculator.add(input)).to eq(30)
    end

    it "returns the sum of multiple numbers" do
      expect(calculator.add('1,2,3')).to eq(6)
    end

    it "handles new line between numbers" do
      expect(calculator.add("1,2\n3,4")).to eq(10)
    end

    it "handles multiple new line characters and multiple numbers with coma and newline character" do
      expect(calculator.add("1,2\n,3,4,5\n6")).to eq(21)
    end

    it "handle different delimiters properly" do
      expect(calculator.add("//;\n1;2;3")).to eq(6)
    end

    it "mocks and check that start_with? called if input string is not empty" do
      input = "//@\n10@20@30"
      expect(input).to receive(:start_with?).and_return(true)
      expect(calculator.add(input)).to eq(60)
    end

    it "mocks and check that start_with? not called when input string is empty" do
      empty_string = ''
      expect(empty_string).not_to receive(:start_with?)
      expect(calculator.add(empty_string)).to eq(0)
    end

    it "throws an exception for negative numbers" do
      expect{ calculator.add("1,-2,3") }.to raise_error("Negative numbers not allowed: -2")
    end

    it "throws an exception for negative numbers and print all negative numbers" do
      expect{ calculator.add("//#\n1#-2#3#4#5#-6#-7#8") }.to raise_error("Negative numbers not allowed: -2, -6, -7")
    end

    it "mocks that extract_delimiter_and_numbers method is called at lease once" do
      expect(calculator).to receive(:extract_delimiter_and_numbers).with("10,20").and_return([',', '10,20'])
      expect(calculator.add("10,20")).to eq(30)
    end
  end
end
