defmodule Day03.One do
  def run() do
    code = Day03.read(Path.join(__DIR__, "sample.txt"))
    # code = Day03.read(Path.join(__DIR__, "input.txt"))

    mul(code)
  end

  def mul(code) do
    reg = ~r/mul\(((?:\d{1,3}\,?){2})\)/

    Regex.scan(reg, code, capture: :all)
    |> Stream.map(fn [_, ints] ->
      String.split(ints, ",")
      |> Enum.map(&String.to_integer/1)
    end)
    |> Stream.map(fn [a, b] ->
      a * b
    end)
    |> Enum.sum()
  end
end
