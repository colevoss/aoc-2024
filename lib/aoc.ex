defmodule AOC do
  @moduledoc """
  Utilities to be used in any solution
  """

  @doc """
  Reads a file line by line and trims the \n character from each line
  """
  def read(path) do
    File.stream!(path, :line)
    |> Stream.map(&String.trim/1)
  end
end
