OPERATION_NAMES = %w[plus minus times divided_by]
NUMBERS_INTO_WORDS = %w[zero one two three four five six seven eight nine]

class Calc

  attr_reader :first_number
  attr_reader :operation_name

  def initialize
    @number
    @operation_name
  end

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

  NUMBERS_INTO_WORDS.each_with_index do |number_as_word, input_number|
    define_method(number_as_word) do

      if (@number and !@operation_name)
        fail getInvalidNumbersSyntaxError()
      end

      if (@number and @operation_name)
        return self.send(:calculate, input_number)
      end

      @number = input_number

      self
    end
  end

  def calculate(input_number)
    previous_number = @number

    case @operation_name
    when "plus"; previous_number + input_number
    when "minus"; previous_number - input_number
    when "times"; previous_number * input_number
    when "divided_by"; previous_number / input_number
    end
  end

  def getInvalidNumbersSyntaxError(input_number)
    user_input_syntax = "#{NUMBERS_INTO_WORDS[@number]}.#{NUMBERS_INTO_WORDS[input_number]}"
    correct_syntax = "#{NUMBERS_INTO_WORDS[@number]}.operation_name.#{NUMBERS_INTO_WORDS[input_number]}"

    return "The syntax '#{user_input_syntax}' is wrong, the correct syntax should be '#{correct_syntax}'"
  end

end
