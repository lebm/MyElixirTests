# Lists e recurson examples
defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head|tail]), do: [ head*head | square(tail) ]

  # I don´t if this definition is correct/useful, bu its is cool! And it works!
  def map([],         _func), do: []
  def map([head|tail], func), do: [ func.(head) | map(tail, func) ]
  def map(a..a,        func), do: [ func.(a) ]
  def map(a..b,        func), do: [ func.(a) | map((a+1)..b,  func) ]

  def reduce([],          value, _func), do: value
  def reduce([head|tail], value,  func), do: reduce(tail, func.(head, value), func)
  def reduce(a..a,        value,  func), do: func.(a, value)
  def reduce(a..b,        value,  func), do: reduce((a+1)..b, func.(a, value), func)

  def mapsum(list, func), do:
      list
      |> map(func)
      |> reduce(0,&(&1+&2))

  def mapreduce(list, initvalue, mapfunc, reducefunc), do:
      list
      |> map(mapfunc)
      |> reduce(initvalue, reducefunc)
end

defmodule Main do
  # You should import only the functions you will need
  # Example only. It is better to user module name when calling external functions.
  # If the module name is long, create an alias
  import MyList, only: [len: 1, square: 1, map: 2, reduce: 3, mapsum: 2, mapreduce: 4]

  def run do
    IO.puts len([1, 2, 3, 4])
    IO.puts len(["a", "b", "c"])
    IO.puts len([:one, "two", 3])

    IO.inspect square([1, 2, 3, 4])

    IO.inspect map([1, 2, 3, 4], fn x -> x + 1 end)
    IO.inspect map([1, 2, 3, 4], &(&1*&1))

    # Using anonymous function "full" syntax
    IO.inspect reduce([1, 2, 3, 4], 0, fn (a, b) -> a + b end)

    # Using anonymous function "capture operatori/shorthand" syntax
    IO.inspect reduce([1, 2, 3, 4], 1, &(&1*&2))

    # Using ranges e pipes
    1..10 |> reduce(1, &(&1*&2)) |> IO.inspect

    # Mapsum using pipes
    IO.inspect mapsum([1, 2, 3, 4], &(&1*&1))
    IO.inspect mapsum([1, 2, 3, 4], &(&1+1))
    IO.inspect mapsum([1, 2, 3, 4], &(&1*10))
    IO.inspect mapsum(1..4, &(&1*&1))
    IO.inspect mapsum(1..4, &(&1+1))
    IO.inspect mapsum(1..4, &(&1*10))

    IO.inspect mapreduce(1..4, 0, &(&1*&1), &(&1+&2))
    IO.inspect mapreduce(1..4, 1, &(&1*&1), &(&1*&2))
  end
end
