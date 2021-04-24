defmodule Times do
#    def double(n) do
#        2 * n
#    end
    def double(n), do: 2 * n
    def triple(n), do: 3 * n
    def quadruple(n), do: double(double(n))
end
