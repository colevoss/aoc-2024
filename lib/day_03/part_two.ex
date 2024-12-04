defmodule Day03.Two do
  alias Day03.One

  def run do
    instruction = ~r/(?<instruction>(do(n\'t)?)\(\))/
    code = Day03.read(Path.join(__DIR__, "input.txt"))

    {sum, _} =
      Regex.split(instruction, code, include_captures: true)
      |> Stream.chunk_every(2)
      |> Enum.reduce({0, :do}, fn chunk, {acc, state} ->
        [code | instruction] = chunk

        IO.inspect({code, instruction})

        next_state =
          case instruction do
            [] -> :do
            ["don't()"] -> :dont
            ["do()"] -> :do
          end

        case state do
          [] ->
            {acc, next_state}

          :dont ->
            {acc, next_state}

          :do ->
            mul = One.mul(code)
            sum = acc + mul

            {sum, next_state}
        end
      end)

    sum
  end
end
