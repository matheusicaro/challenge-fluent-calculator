require "test_helper"

class CalcTest < ActiveSupport::TestCase

  # describe wrong syntaxes
  test "should raise error when the input syntax is wrong by multi operations declared" do
    assert_raises("Multi operation are not allowed. The operation 'divided_by' was defined first than 'divided_by'"){
      Calc.new.divided_by.one.divided_by.one
    }
  end

  test "should raise error when the input syntax is wrong by sequence of numbers without operation is declared" do
    assert_raises("The syntax 'one.one' is wrong, the correct syntax should be 'one.operation_name.one'"){
      Calc.new.one.one.times.one
    }
  end
  #
  # describe sum
  # 
  test "should sum correctly when the inputs are the same number" do
    assert_equal(2, Calc.new.one.plus.one)
  end

  test "should sum correctly when a big number is declared first" do
    assert_equal(9, Calc.new.five.plus.four)
  end

  test "should sum correctly when a smaller number is declared first" do
    assert_equal(16, Calc.new.seven.plus.nine)
  end
  #
  # describe minus
  #
  test "should subtract correctly and return zero when the inputs are the same number" do
    assert_equal(0, Calc.new.three.minus.three)
  end

  test "should subtract correctly when a big number is declared first" do
    assert_equal(7, Calc.new.eight.minus.one)
  end

  test "should subtract correctly when a smaller number is declared first" do
    assert_equal(-2, Calc.new.four.minus.six)
  end
  #
  # describe times
  # 
  test "should multiply correctly when the inputs are the same number" do
    assert_equal(0, Calc.new.zero.times.zero)
  end

  test "should multiply correctly when a big number is declared first" do
    assert_equal(20, Calc.new.five.times.four)
  end

  test "should multiply correctly when a smaller number is declared first" do
    assert_equal(72, Calc.new.eight.times.nine)
  end
  #
  # describe divided_by
  #
  test "should divide correctly when the inputs are the same number" do
    assert_equal(1, Calc.new.five.divided_by.five)
  end

  test "should divide correctly when a big number is declared first" do
    assert_equal(3.5, Calc.new.seven.divided_by.two)
  end

  test "should divide correctly when a smaller number is declared first" do
    assert_equal(0.11, Calc.new.one.divided_by.nine)
  end
end
