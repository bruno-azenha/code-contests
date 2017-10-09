defmodule FairRations do

  require Integer

  defp handle_input() do
    IO.gets("") # Ignores first line
    IO.gets("")
      |> String.split()
      |> Enum.map(&(String.trim(&1)))
      |> Enum.map(&(String.to_integer(&1)))
  end

  defp give_bread_to_line(line) do
    give_bread_to_line(line, 0, 0)
  end
  defp give_bread_to_line(line, index, number_of_given_loaves) do
    case Enum.all?(line, &(Integer.is_even(&1))) do
      true -> {:ok, number_of_given_loaves}
      false ->
        case Integer.is_even(Enum.at(line, index)) do
          true -> give_bread_to_line(line, index + 1, number_of_given_loaves)
          false ->
            case give_loaves(line, index) do
              :error -> :error
              line -> give_bread_to_line(line, index + 1, number_of_given_loaves + 2)
            end
        end

    end
  end

  defp give_loaves(line, index) do
    case index + 1 == length(line) do
      true -> :error
      false ->
        line
        |> List.replace_at(index, Enum.at(line, index) + 1)
        |> List.replace_at(index + 1, Enum.at(line, index + 1) + 1)
    end
  end

  def main() do
    line = handle_input()

    case give_bread_to_line(line) do
      {:ok, number_of_loaves} -> IO.puts("#{number_of_loaves}")
      :error -> IO.puts("NO")
    end
  end
end

FairRations.main()
