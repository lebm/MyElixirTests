defmodule StreamTest do
  def large_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.filter(&(String.length(&1) > 60))
  end

  def line_lengths!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.map(&(String.length(&1)))
  end

  def longest_line_length!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.map(&(String.length(&1)))
    |> Enum.reduce(fn linelen, curmax -> if linelen > curmax, do: linelen, else: curmax end)
  end

  def words_per_line!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.map(&(length(String.split(&1))))
  end
end

StreamTest.large_lines!("LICENSE")
|> IO.inspect()

StreamTest.line_lengths!("LICENSE")
|> IO.inspect()

StreamTest.longest_line_length!("LICENSE")
|> IO.inspect()

StreamTest.words_per_line!("LICENSE")
|> IO.inspect()
