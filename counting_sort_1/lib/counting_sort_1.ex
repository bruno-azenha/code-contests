defmodule CountingSort1 do

  def handle_input() do
    IO.gets("") # Ignores first line
    IO.gets("")
      |> String.split()
      |> Enum.map(&(String.trim(&1)))
      |> Enum.map(&(String.to_integer(&1)))
  end

  def add_one_to_map_value_under_key(map, key) do
    Map.update(map, key, 1, &(&1 + 1))
  end

  def create_zeros_map() do
    0..99
      |> Enum.to_list()
      |> Enum.reduce(%{}, fn(elem, acc) -> Map.merge(%{elem => 0}, acc) end)
  end

  def main() do
    list_of_numbers = handle_input()
    zeros_map = create_zeros_map()

    list_of_numbers
      |> Enum.reduce(zeros_map, fn(number, acc) -> add_one_to_map_value_under_key(acc, number) end)
      |> Enum.sort()
      |> Enum.map(fn({_k, v}) -> v end)
      |> Enum.join(" ")
      |> IO.puts()
  end
end

CountingSort1.main()
