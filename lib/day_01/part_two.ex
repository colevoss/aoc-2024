defmodule Day01.Two do
  def run do
    file = Path.join(__DIR__, "input.txt")

    %{:r => r, :l => l} =
      Day01.read(file)
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
  end
end
