require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe "#add" do
    it "checks method exists or not" do
      expect( StringCalculator.instance_methods.include?(:add) ).to eq(true)
    end

    it "checks method accepts one argument" do
      calculator = StringCalculator.new
      expect { calculator.add }.to raise_error(ArgumentError)
    end

    it "handles that empty string input returns 0" do
      calculator = StringCalculator.new
      expect(calculator.add('')).to eq(0)
    end
  end
end
