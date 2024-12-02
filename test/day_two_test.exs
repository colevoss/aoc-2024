defmodule DayTwoTest do
  use ExUnit.Case

  doctest Day02.One

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
end
