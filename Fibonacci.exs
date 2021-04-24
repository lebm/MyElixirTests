defmodule Fibonacci do
  def run(num) when num > 0 do
    Stream.unfold({1, 1}, fn {a, b} ->  
      {a, {b, a + b}}
    end)
    |> Enum.take(num)
  end
end

IO.gets("Enter the limit: ")
|> String.strip
|> String.to_integer
|> Fibonacci.run
|> IO.inspect
