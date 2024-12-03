defmodule DayTwoTest do
  use ExUnit.Case

  doctest Day02.One
  doctest Day02.Two

  test "is_safe? is true when ascending and diffs are safe" do
    assert Day02.One.is_safe?([
             [0, 1],
             [1, 2],
             [3, 4]
           ]) == true
  end

  test "is_safe? is true when descending and diffs are safe" do
    assert Day02.One.is_safe?([
             [4, 3],
             [3, 2],
             [2, 1]
           ]) == true
  end

  test "is_safe? is false when ascending and diffs are not safe" do
    assert Day02.One.is_safe?([
             [0, 1],
             [1, 10]
           ]) == false
  end

  test "is_safe? is false when descending and diffs are not safe" do
    assert Day02.One.is_safe?([
             [10, 9],
             [9, 5]
           ]) == false
  end

  test "filter_safe is true" do
    [
      {[23, 26, 27, 29, 32, 35, 36], true},
      {[99, 98, 96, 93, 90, 87, 84], true},
      {[25, 24, 21, 19, 16, 13, 11], true},
      {[89, 87, 85, 82, 79, 78, 75], true},
      {[1, 4, 5, 8, 11, 12, 9], false},
      {[1, 1, 1, 1, 1], false},
      {[1, 2, 2, 3, 4], true},
      {[91, 89, 91, 93, 94, 99], false},
      {[91, 89, 91, 93, 94, 96], true}
    ]
    |> Enum.each(fn {list, is_safe} ->
      assert Day02.Two.filter_safe(list) == is_safe
    end)
  end
end
