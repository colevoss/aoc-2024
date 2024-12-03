defmodule Day02.Two do
  alias Day02.One

  def run do
    file = Path.join(__DIR__, "input.txt")

    Day02.read(file)
    # |> Stream.map(&Enum.chunk_every(&1, 2, 1, :discard))
    |> Stream.filter(&filter_safe/1)
    |> Enum.count()
  end

  @doc """
    iex> Day02.Two.filter_safe([7, 6, 4, 2, 1])
    true
    iex> Day02.Two.filter_safe([1, 2, 7, 8, 9])
    false
    iex> Day02.Two.filter_safe([1, 3, 2, 4, 5])
    true
  """
  def filter_safe(levels, try \\ -1) do
    case try do
      t when t <= length(levels) - 1 ->
        levels_to_filter =
          case try do
            t when t < 0 ->
              levels

            t when t <= length(levels) - 1 ->
              l = List.delete_at(levels, try)
              l
          end

        if is_safe?(levels_to_filter) do
          true
        else
          filter_safe(levels, try + 1)
        end

      _ ->
        false
    end
  end

  def is_safe?(levels) when is_nil(levels), do: false

  def is_safe?(levels) do
    chunked = Enum.chunk_every(levels, 2, 1, :discard)
    first_dir = One.dir(hd(chunked))

    Enum.all?(chunked, fn l_chunk ->
      One.is_diff_safe?(l_chunk) and One.dir(l_chunk) == first_dir
    end)
  end
end
