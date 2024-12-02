file = "./input.txt"
# file = "./sample.txt"

%{:r => r, :l => l} =
  File.stream!(file, :line)
  # Trim \n
  |> Stream.map(&String.trim/1)
  # Split into two lists
  |> Stream.map(&String.split(&1, "   "))
  # to_integer each number in list
  |> Stream.map(fn parts -> parts |> Enum.map(&String.to_integer/1) end)
  |> Enum.to_list()
  # Count how many times the number occurs in each list
  |> Enum.reduce(%{l: %{}, r: %{}}, fn [l_el, r_el], acc ->
    %{
      l: Map.put(acc.l, l_el, 1 + Map.get(acc.l, l_el, 0)),
      r: Map.put(acc.r, r_el, 1 + Map.get(acc.r, r_el, 0))
    }
  end)

l
|> Map.to_list()
|> Enum.map(fn {l_num, l_times} ->
  # Effectively loops l_times and adds the product of the amout of times l_num is in r
  # and sums the array
  s =
    Stream.repeatedly(fn ->
      r_num = Map.get(r, l_num, 0)

      l_num * r_num
    end)
    |> Enum.take(l_times)
    |> Enum.sum()

  s
end)
|> Enum.sum()
|> IO.inspect()
