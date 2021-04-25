defmodule MyList2 do
  def span(a, a), do: [a]
  def span(a, b), do: [ a | span(a+1, b) ]
end
