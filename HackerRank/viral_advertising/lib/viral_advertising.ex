defmodule ViralAdvertising do

  defp handle_input() do
    IO.gets("")
    |> String.trim()
    |> String.to_integer()
  end

  def find_virality(n), do: do_find_virality(n, 1, [])
  def do_find_virality(n, 1, []) when (n >= 1) do
    do_find_virality(n, 2, [2])
  end
  def do_find_virality(n, current, [h | _t] = list) when (n >= current) do
    do_find_virality(n, current + 1, [calculate_impacted(h) | list])
  end
  def do_find_virality(n, current, list) when (n < current) do
    Enum.sum(list)
  end

  def calculate_impacted(impacted_day_before) do
    div(impacted_day_before * 3, 2)
  end

  def main do
    handle_input()
    |> find_virality()
    |> IO.puts()
  end

end

ViralAdvertising.main()
