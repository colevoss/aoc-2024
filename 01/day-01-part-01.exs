file = "./input.txt"
# file = "./sample.txt"

lists =
  File.stream!(file, :line)
  # Trim \n
  |> Stream.map(&String.trim/1)
  # Split into two lists
  |> Stream.map(&String.split(&1, "   "))
  # to_integer each number in list
  |> Stream.map(fn parts -> parts |> Enum.map(&String.to_integer/1) end)
  # zip lists together
  |> Stream.zip()
  # Sort each list
  |> Stream.map(fn list ->
    list
    |> Tuple.to_list()
    |> Enum.sort()
  end)
  |> Enum.to_list()

defmodule DayOne do
  def sum([fhead | ftail], [lhead | ltail], acc) do
    diff = abs(abs(fhead) - abs(lhead))

    acc = diff + acc
    sum(ftail, ltail, acc)
  end

  def sum([], [], acc) do
    acc
  end
end

[first, last] = lists

sum = DayOne.sum(first, last, 0)

IO.puts(sum)
