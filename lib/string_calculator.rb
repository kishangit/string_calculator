class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter_and_numbers(numbers)
    nums = numbers.split(delimiter).map(&:to_i)
    negatives = nums.select { |n| n < 0 }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    nums.sum
  end

  private

  def extract_delimiter_and_numbers(numbers)
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..]
    else
      delimiter = /[\n,]/
    end
    [delimiter, numbers]
  end
end
