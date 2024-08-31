class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..]
    else
      delimiter = /[\n,]/
    end

    nums = numbers.split(delimiter).map(&:to_i)
    negatives = nums.select {|n| n < 0}
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    nums.sum
  end
end
