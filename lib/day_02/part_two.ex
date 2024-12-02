defmodule Day02.Two do
  def run do
    file = Path.join(__DIR__, "input.txt")

    Day02.read(file)
    |> Stream.map(&Enum.chunk_every(&1, 2, 1, :discard))
  end
end
