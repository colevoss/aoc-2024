defmodule Day03 do
  def read(path) do
    File.stream!(path, 2048)
    |> Enum.join()
  end
end
