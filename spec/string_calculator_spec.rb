require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe "#add" do
    let(:calculator) { StringCalculator.new }
    let(:test_input) { "10,20" }

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
      expect(test_input).to receive(:split).and_return(['10','20'])
      expect(calculator.add(test_input)).to eq(30)
    end

    it "returns the sum of multiple numbers" do
      expect(calculator.add('1,2,3')).to eq(6)
    end
  end
end
