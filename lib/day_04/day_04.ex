defmodule Day04 do
  def read(file) do
    Path.join(__DIR__, file)
    |> AOC.read()
  end
end
