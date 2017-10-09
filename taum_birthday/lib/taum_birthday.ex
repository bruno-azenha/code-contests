defmodule TaumBirthday do

  require Integer

  defp handle_test_input() do
    [b, w] = IO.gets("") |> get_list_from_input_line()
    [x, y, z] = IO.gets("") |> get_list_from_input_line()
    {b, w, x, y, z}
  end

  defp get_list_from_input_line(line) do
    line
    |> String.split()
    |> Enum.map(&(String.trim(&1)))
    |> Enum.map(&(String.to_integer(&1)))
  end

  # Cheaper to convert B to W
  defp calculate_total_cost({b, w, x, y, z}) when ((x + z) < y) do
    b * x + w * (x + z)
  end

  # Cheaper to convert W to B
  defp calculate_total_cost({b, w, x, y, z}) when ((y + z) < x) do
    w * y + b * (y + z)
  end

  # Converting B to W or vice versa is pointless
  defp calculate_total_cost({b, w, x, y, _z}) do
    b * x + w * y
  end

  def main do
    number_of_tests =
      IO.gets("")
      |> String.trim()
      |> String.to_integer()

    for _i <- 1..number_of_tests do
      handle_test_input()
      |> calculate_total_cost()
      |> IO.puts()
    end
  end
end

TaumBirthday.main()
