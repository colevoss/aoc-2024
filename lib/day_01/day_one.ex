defmodule Day01 do
  def read(path) do
    AOC.read(path)
    # Split into two lists
    |> Stream.map(&String.split(&1, "   "))
    # to_integer each number in list
    |> Stream.map(fn parts -> parts |> Enum.map(&String.to_integer/1) end)
  end
end
