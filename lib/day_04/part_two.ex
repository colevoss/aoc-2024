defmodule Day04.Two do
  alias Day04.One.Grid

  def run do
    # Day04.read("sample.txt")
    Day04.read("input.txt")
    |> Enum.map(&String.split(&1, "", trim: true))
    |> do_massearch()
  end

  @searches [
    # down-right
    {1, 1},
    # down-left
    {1, -1},
    # up-right
    {-1, 1},
    # up-left
    {-1, -1}
  ]

  def do_massearch(grid) do
    {_, total} =
      Enum.reduce(grid, {0, 0}, fn row, {row_i, row_sum} ->
        {_, mases} =
          Enum.reduce(row, {0, 0}, fn _, {col_i, col_sum} ->
            x_mases = if find_x_mas(grid, row_i, col_i), do: 1, else: 0

            {col_i + 1, col_sum + x_mases}
          end)

        {row_i + 1, row_sum + mases}
      end)

    total
  end

  def find_x_mas(grid, row, col) do
    char = Grid.char_at(grid, row, col)

    case char do
      "A" ->
        is_x_mas(grid, row, col, [], @searches)

      _ ->
        false
    end
  end

  def is_x_mas(_, _, _, found, []) do
    case found do
      ["S", "M", "S", "M"] ->
        true

      ["M", "S", "M", "S"] ->
        true

      ["M", "M", "S", "S"] ->
        true

      ["S", "M", "M", "S"] ->
        true

      ["S", "S", "M", "M"] ->
        true

      ["M", "S", "S", "M"] ->
        true

      _ ->
        false
    end
  end

  def is_x_mas(grid, row, col, found, [{row_d, col_d} | rest]) do
    char = Grid.char_at(grid, row + row_d, col + col_d)

    case char do
      c when c in ["S", "M"] ->
        is_x_mas(grid, row, col, found ++ [char], rest)

      _ ->
        false
    end
  end
end
