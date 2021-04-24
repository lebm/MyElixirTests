defmodule Sum do
	def up_to(n), do: up(n,0)

	def up(0,acc), do: acc
	def up(n,acc), do: up(n-1,acc+n)
end
