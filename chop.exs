defmodule Chop do
    def guess(n, a..b) when is_integer(n) and n>0 and a>=0 and b>=0 and b>a do
        g(n, a..b, div(a+b,2))
    end
    def guess(_, _), do: IO.puts("Uso: guess(positivo, range)")

    defp g(n, _.._, n), do: n
    defp g(n, a.._, x) when n<x do
        IO.puts "Is #{x}"
        g(n, a..(x-1), div(a+x-1,2))
    end
    defp g(n, _..b, x) when n>x do
        IO.puts "Is #{x}"
        g(n, (x+1)..b, div(x+1+b,2))
    end

end

IO.puts Chop.guess(37, 1..100)
