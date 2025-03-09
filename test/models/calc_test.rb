require "test_helper"

class CalcTest < ActiveSupport::TestCase
  test "should do math plus correctly for each number" do
    expected_
    result = Calc.new.two.plus.one
    assert_equal(2, result, "the value should be 3")
  end
end
