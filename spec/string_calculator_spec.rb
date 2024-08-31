require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe "#add" do
    it "checks method #add exists or not" do
      expect( StringCalculator.instance_methods.include?(:add) ).to eq(true)
    end
  end
end
