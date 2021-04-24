defmodule Lista do
	def soma(l), do: up(l,0)

	def up([],acc), do: acc
	def up([h|t],acc), do: up(t,acc+h)
end
