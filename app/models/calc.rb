OPERATION_NAMES = %w[plus minus times divided_by]
NUMBERS_INTO_WORDS = %w[zero one two three four five six seven eight nine]

class Calc

  attr_reader :first_number
  attr_reader :operation_name

  def initialize
    @number
    @operation_name
  end

  # Define dynamically functions for each item declared at OPERATION_NAMES 
  # 
  # The arg operation_name represents the operation symbol name which add the reference due to the item from the list
  OPERATION_NAMES.each do |operation_name|
    define_method(operation_name) do
      input = operation_name

      if (@operation_name)
        raise "Multi operation are not allowed. The operation '#{@operation_name}' was defined first than '#{operation_name}'"
      end

      @operation_name = input
      self
    end
  end

  # Define dynamically functions for each item declared at NUMBERS_INTO_WORDS 
  # 
  # The arg number_as_word is the string number as world declared, which is the properly item.
  # The arg input_number is the index which is also represent the real number for the number_as_word declared.
  NUMBERS_INTO_WORDS.each_with_index do |number_as_word, input_number|
    define_method(number_as_word) do

      if (@number and !@operation_name)
        fail getInvalidNumbersSyntaxError(input_number)
      end

      if (@number and @operation_name)
        return self.send(:calculate, input_number)
      end

      @number = input_number

      self
    end
  end

  # Calculate the result of the syntax declaration.
  #
  # The first number declared is saved at @number.
  # The second number declared comes from the function second_number_input.
  # The operation symbol was saved at @operation_name.
  def calculate(second_number_input)
    previous_number = @number.to_f
    input_number = second_number_input.to_f

    case @operation_name
    when "plus"; previous_number + input_number
    when "minus"; previous_number - input_number
    when "times"; previous_number * input_number
    when "divided_by"; (previous_number / input_number).round(2) # max two decimals
    end
  end

  # Function to return the dynamic message by inputs entrance from the user.
  # Given in the syntax input as: Calc.new.one.one.times.one
  # Will returns the follow string: "The syntax 'one.one' is wrong, the correct syntax should be 'one.operation_name.one'"
  def getInvalidNumbersSyntaxError(input_number)
    user_input_syntax = "#{NUMBERS_INTO_WORDS[@number]}.#{NUMBERS_INTO_WORDS[input_number]}"
    correct_syntax = "#{NUMBERS_INTO_WORDS[@number]}.#{@symbol || "operation_name"}.#{NUMBERS_INTO_WORDS[input_number]}"

    return "The syntax '#{user_input_syntax}' is wrong, the correct syntax should be '#{correct_syntax}'"
  end

end
