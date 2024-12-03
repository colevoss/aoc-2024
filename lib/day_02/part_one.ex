defmodule Day02.One do
  def run do
    file = Path.join(__DIR__, "input.txt")

    Day02.read(file)
    |> Stream.map(&Enum.chunk_every(&1, 2, 1, :discard))
    |> Stream.filter(&Day02.One.is_safe?/1)
    |> Enum.count()
  end

  @doc """
    iex> Day02.One.dir([1, 2])
    :asc
    iex> Day02.One.dir([2, 1])
    :desc
  """
  def dir([a, b]) when a < b, do: :asc
  def dir([a, b]) when a > b, do: :desc
  def dir([a, b]) when a == b, do: :error

  def is_safe?(levels) do
    # Rewrote it better in round 2
    Day02.Two.is_safe?(levels)

    # first_dir = dir(hd(levels))
    #
    # safe =
    #   Enum.reduce_while(levels, first_dir, fn l_chunk, acc_dir ->
    #     if is_diff_safe?(l_chunk) do
    #       if dir(l_chunk) == acc_dir do
    #         {:cont, acc_dir}
    #       else
    #         {:halt, :error}
    #       end
    #     else
    #       {:halt, :error}
    #     end
    #   end)
    #
    # safe != :error
  end

  @doc ~S"""
  ## Examples
    iex> Day02.One.is_diff_safe?([1, 2])
    true
    iex> Day02.One.is_diff_safe?([1, 3])
    true
    iex> Day02.One.is_diff_safe?([1, 5])
    false
    iex> Day02.One.is_diff_safe?([2, 1])
    true
    iex> Day02.One.is_diff_safe?([10, 1])
    false
  """
  def is_diff_safe?([a, b]) do
    diff = abs(a - b)
    diff <= 3 and diff >= 1
  end
end
