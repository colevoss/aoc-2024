defmodule Day01.One do
  def run do
    file = Path.join(__DIR__, "input.txt")

    [left, right] =
      Day01.read(file)
      # zip lists together
      |> Stream.zip()
      # Sort each list
      |> Stream.map(fn list ->
        list
        |> Tuple.to_list()
        |> Enum.sort()
      end)
      |> Enum.to_list()

    sum(left, right, 0)
  end

  defp sum([rhead | ftail], [lhead | ltail], acc) do
    diff = abs(rhead - lhead)

    acc = diff + acc
    sum(ftail, ltail, acc)
  end

  defp sum([], [], acc) do
    acc
  end
end
