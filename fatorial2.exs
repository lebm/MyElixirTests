defmodule Fatorial2 do
    def of(0), do: 1
    def of(n), do: n * of(n-1)
end
