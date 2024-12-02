defmodule Day02 do
  def read(path) do
    AOC.read(path)
    |> Stream.map(&String.split(&1, " "))
    |> Stream.map(fn parts ->
      parts
      |> Enum.map(&String.to_integer/1)
    end)
  end
end

