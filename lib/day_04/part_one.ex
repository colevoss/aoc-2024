defmodule Day04.One do
  alias Day04.One.Grid

  def run() do
    # Day04.read("sample.txt")
    Day04.read("input.txt")
    |> Enum.map(&String.split(&1, "", trim: true))
    |> do_wordsearch()
  end

  def do_wordsearch(grid) do
    {_, total} =
      grid
      |> Enum.reduce({0, 0}, fn grid_row, {row_i, row_sum} ->
        {_, x} =
          Enum.reduce(grid_row, {0, 0}, fn _, {col_i, col_sum} ->
            xmases = Grid.find_xmas(grid, {row_i, col_i})

            {col_i + 1, col_sum + xmases}
          end)

        {row_i + 1, row_sum + x}
      end)

    total
  end

  defmodule Grid do
    @searches [
      # right
      {0, 1},
      # left
      {0, -1},
      # up
      {-1, 0},
      # down
      {1, 0},
      # down-right
      {1, 1},
      # down-left
      {1, -1},
      # up-right
      {-1, 1},
      # up-left
      {-1, -1}
    ]

    def char_at(_grid, row, _col) when row < 0, do: nil
    def char_at(_grid, _row, col) when col < 0, do: nil

    def char_at(grid, row, col) do
      case Enum.at(grid, row) do
        nil ->
          nil

        r ->
          case Enum.at(r, col) do
            nil ->
              nil

            char ->
              char
          end
      end
    end

    def find_xmas(grid, {row, col}) do
      @searches
      |> Enum.reduce(0, fn delta, sum ->
        char = char_at(grid, row, col)

        sum +
          case char do
            "X" ->
              # IO.inspect(char, label: "looking")
              # if is_xmas(grid, char, {row, col}, delta), do: 1, else: 0
              if is_xmas(grid, ["X"], {row, col}, delta), do: 1, else: 0

            _ ->
              0
          end
      end)
    end

    def is_xmas(grid, chars, {row, col}, {row_d, col_d}) do
      next_row = row + row_d
      next_col = col + col_d

      next_char = char_at(grid, next_row, next_col)

      case {chars, next_char} do
        {["X"], "M"} ->
          is_xmas(grid, chars ++ [next_char], {next_row, next_col}, {row_d, col_d})

        {["X", "M"], "A"} ->
          is_xmas(grid, chars ++ [next_char], {next_row, next_col}, {row_d, col_d})

        {["X", "M", "A"], "S"} ->
          true

        _ ->
          false
      end
    end

    # def is_xmas(_grid, char, _coord, _delta) when is_nil(char), do: false
    #
    # def is_xmas(grid, char, {row, col}, {row_d, col_d}) do
    #   next_row = row + row_d
    #   next_col = col + col_d
    #
    #   next_char = char_at(grid, next_row, next_col)
    #
    #   case {char, next_char} do
    #     {_, nil} ->
    #       false
    #
    #     {nil, _} ->
    #       false
    #
    #     {"X", "M"} ->
    #       is_xmas(grid, next_char, {next_row, next_col}, {row_d, col_d})
    #
    #     {"M", "A"} ->
    #       is_xmas(grid, next_char, {next_row, next_col}, {row_d, col_d})
    #
    #     {"A", "S"} ->
    #       IO.inspect({:found, char, row, col, row_d, col_d})
    #       true
    #
    #     _ ->
    #       false
    #   end
    # end
  end
end
