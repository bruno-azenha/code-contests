defmodule AngryProfessor do

  defp handle_test_input() do
    [n, k] = IO.gets("") |> get_list_from_input_line()
    arrival_times = IO.gets("") |> get_list_from_input_line()
    {n, k, arrival_times}
  end

  defp handle_output(true), do: IO.puts("YES")
  defp handle_output(false), do: IO.puts("NO")

  defp get_list_from_input_line(line) do
    line
    |> String.split()
    |> Enum.map(&(String.trim(&1)))
    |> Enum.map(&(String.to_integer(&1)))
  end

  defp class_canceled?({_n, k, arrival_times}) do
    students_on_time =
      arrival_times
      |> Enum.filter(&(&1 <= 0))
      |> Enum.count()

    if students_on_time < k, do: true, else: false
  end

  def main do
    number_of_tests =
      IO.gets("")
      |> String.trim()
      |> String.to_integer()

    for _i <- 1..number_of_tests do
      handle_test_input()
      |> class_canceled?()
      |> handle_output()
    end
  end

end

AngryProfessor.main()
