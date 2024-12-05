defmodule Day04Test do
  alias Day04.One.Grid
  use ExUnit.Case

  doctest Day04.One
  doctest Day04.One.Grid

  test "char_at returns a the character from row, col" do
    char = Day04.One.Grid.char_at([[1, 2, 3], [4, 5, 6]], 1, 0)
    assert char == 4
  end

  test "is_xmas returns true when it finds xmas in a row" do
    grid = [
      ["X", "M", "A", "S"],
      ["S", "A", "M", "X"]
    ]

    assert Grid.is_xmas(grid, ["X"], {0, 0}, {0, 1}) == true
    assert Grid.is_xmas(grid, ["X"], {1, 3}, {0, -1}) == true
  end

  test "is_xmas returns true when it finds xmas in a column" do
    grid = [
      ["X", "S"],
      ["M", "A"],
      ["A", "M"],
      ["S", "X"]
    ]

    assert Grid.is_xmas(grid, ["X"], {0, 0}, {1, 0}) == true
    assert Grid.is_xmas(grid, ["X"], {3, 1}, {-1, 0}) == true
  end

  test "is_xmas returns true when it finds xmas diagonally" do
    grid = [
      ["S", "0", "0", "0", "0", "0", "S"],
      ["0", "A", "0", "0", "0", "A", "0"],
      ["0", "0", "M", "0", "M", "0", "0"],
      ["0", "0", "0", "X", "0", "0", "0"],
      ["0", "0", "M", "0", "M", "0", "0"],
      ["0", "A", "0", "0", "0", "A", "0"],
      ["S", "0", "0", "0", "0", "0", "S"]
    ]

    assert Grid.is_xmas(grid, ["X"], {3, 3}, {1, 1}) == true
    assert Grid.is_xmas(grid, ["X"], {3, 3}, {1, -1}) == true
    assert Grid.is_xmas(grid, ["X"], {3, 3}, {-1, 1}) == true
    assert Grid.is_xmas(grid, ["X"], {3, 3}, {-1, -1}) == true
  end

  test "find_xmas finds all xmas's for an X" do
    grid = [
      ["S", "0", "0", "0", "0", "0", "S"],
      ["0", "A", "0", "0", "0", "A", "0"],
      ["0", "0", "M", "0", "M", "0", "0"],
      ["0", "0", "0", "X", "0", "0", "0"],
      ["0", "0", "M", "0", "M", "0", "0"],
      ["0", "A", "0", "0", "0", "A", "0"],
      ["S", "0", "0", "0", "0", "0", "S"]
    ]

    assert Grid.find_xmas(grid, {3, 3}) == 4
  end

  test "do_wordsearch is awesome" do
    grid = [
      ["S", "0", "0", "0", "0", "0", "S"],
      ["0", "A", "0", "0", "0", "A", "0"],
      ["0", "0", "M", "0", "M", "0", "0"],
      ["0", "0", "0", "X", "0", "0", "0"],
      ["0", "0", "M", "0", "M", "0", "0"],
      ["0", "A", "0", "0", "0", "A", "0"],
      ["S", "0", "0", "0", "0", "0", "S"]
    ]

    assert Day04.One.do_wordsearch(grid) == 4
  end

  test "x-mas" do
    grid = [
      ["M", "M", "M", "M", "S", ".", "M"],
      [".", "A", "A", ".", "A", "A", "."],
      ["S", "S", "S", "S", "M", ".", "M"],
      [".", ".", ".", ".", ".", ".", "."],
      ["M", ".", "M", ".", ".", "S", "."],
      [".", "A", ".", ".", ".", ".", "A"],
      ["S", ".", "S", ".", ".", "M", "."]
    ]

    assert Day04.Two.do_massearch(grid) == 3
  end
end
