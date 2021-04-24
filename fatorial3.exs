defmodule Fatorial3 do
    def of(n) when is_integer(n) and n>=0, do: trfat(n,1)

    defp trfat(0, n), do: n
    defp trfat(n, a), do: trfat(n-1, a * n)

    def main do
        of(10)
    end
end
