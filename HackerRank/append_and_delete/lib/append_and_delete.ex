defmodule AppendAndDelete do
  @moduledoc """
  Documentation for AppendAndDelete.
  """

  defp handle_input() do
    first_string = IO.gets("") |> String.trim()
    second_string = IO.gets("") |> String.trim()
    number_of_operations = IO.gets("") |> String.trim() |> String.to_integer()

    {first_string, second_string, number_of_operations}
  end

  def solve(first_string, second_string, number_of_operations) do

    {needed_operations, first_rest, second_rest} = calculate_needed_operations(first_string, second_string)
    cond do
      String.length(first_string <> second_string) <= number_of_operations -> true
      needed_operations == number_of_operations -> true
      String.length(first_rest <> second_rest) == number_of_operations -> true
      (String.length(first_rest <> second_rest) < number_of_operations) and needed_operations < number_of_operations and rem((number_of_operations - needed_operations), 2) == 0 -> true
      true -> false
    end

  end

  def calculate_needed_operations(first_string, second_string) do
    {first_rest, second_rest} = remove_common_initial_part(first_string, second_string)
    {String.length(first_rest) + String.length(second_rest), first_rest, second_rest}
  end

  def remove_common_initial_part("", second_string) do
    {"", second_string}
  end

  def remove_common_initial_part(first_string, "") do
    {first_string, ""}
  end

  def remove_common_initial_part(first_string, second_string) do
    {first_char, first_rest} = String.next_grapheme(first_string)
    {second_char, second_rest} = String.next_grapheme(second_string)

    if first_char == second_char do
      remove_common_initial_part(first_rest, second_rest)
    else
      {first_string, second_string}
    end
  end

  def main() do
    {first_line, second_line, number_of_operations} = handle_input()

    case solve(first_line, second_line, number_of_operations) do
      true -> IO.puts("Yes")
      false -> IO.puts("No")
    end
  end
end

AppendAndDelete.main()
