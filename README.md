# String Calculator

The **String Calculator** is a Ruby-based program developed following Test-Driven Development (TDD) principles. It provides a method to parse and sum numbers provided in a string format with various delimiters. The calculator handles multiple numbers, different delimiters, newlines as delimiters, and raises exceptions for negative numbers.


## Tech Stack

- **Programming Language:** Ruby 3.1.2
- **Testing Framework:** RSpec 3.13
- **Version Control:** Git


## Required setup
You need Ruby and Git installed in system to run this program.


## Approach to resolve the problem

This project follows a strict **Test-Driven Development(TDD)** Approach.
- I begin by writing a failing test case for the simplest scenario.
- Then i was writing the minimum code necessary to make the test pass
- With each passing test i was refactoring code to improve readability and efficiency and also ensuring that all tests still pass
- I repeated the cycle for increasingly complex cases like handling multiple numbers, custom delimiters and negative numbers

Throughout the process, I was commiting each change to the git repository, demonstrating the complete cycle of TDD.

## Steps to run this program
1. Clone the repo.<br />
```
git clone https://github.com/kishangit/string_calculator.git
```
2. go to the code directory of repo<br />
```
cd string_calculator
```
3. Install the dependencies<br />
```
bundle install
```
4. Open irb by running below command
```
irb
```
5. Import that `StringCalculator` code in irb using `require_relative`
```
require_relative 'lib/string_calculator'
```
6. Create instance of the `StringCalculator` class
```
calculator = StringCalculator.new
```
7. Create input string and pass it into `calculator.add` method as input params
```
str = "1,2,3"
calculator.add(str)
#=> 6

str = "1\n2\n3,4"
#=> 10

str = "1,2,3\n4,5,6\n7\n8\n9\n10"
#=> 55
```

## Run test cases
1. Go to the project directory
```
cd string_calculator
```
2. Run test cases using RSpec
```
rspec spec/
```


## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your enhancements.

## License
This project is licensed under MIT license.
