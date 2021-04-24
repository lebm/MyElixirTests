defmodule Max do
	def of([a]), do: a
	def of([a, b]) when a >= b, do: a
	def of([a, b]) when b >  a, do: b
	def of([a, b |resto]) when a >= b, do: of([a|resto])
	def of([a, b |resto]) when b >  a, do: of([b|resto])
end
