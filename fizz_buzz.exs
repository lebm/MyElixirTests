defmodule FizzBuzz do
    # Definição de atributos do módulo
    @fzbz "FizzBuzz"
    @fz   "Fizz"
    @bz   "Buzz"

    # Exemplo (forçado) de uso de atributo
    defp teste(0, 0, _), do: @fzbz
    defp teste(0, _, _), do: @fz
    defp teste(_, 0, _), do: @bz
    defp teste(_, _, x), do: x

    def of(n) do
        teste(rem(n,3), rem(n,5), n)
    end

end

defmodule Main do
    # Importando a função "of" de FizzBuzz
    import FizzBuzz, only: [of: 1]

    10..17
    |> Stream.map(&of/1) 
    |> Enum.each(&IO.puts/1) 

    saida = 1..20 |> Stream.map(&of/1)

    saida |> Enum.each(&IO.inspect/1)
end
