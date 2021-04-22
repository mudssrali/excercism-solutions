defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.map(fn char -> if char == ?_ do ?\ else char end end)
    |> Enum.filter(fn char -> char == ?-
                           or (?a <= char and char <= ?z)
                           or (?1 <= char and char <= ?9)
                           or char == ?ß
                           or char == ?ä
                           or char == ?ö
                           or char == ?ü
                           or char == ?\ end)
    |> List.to_string()
    |> String.split()
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    |> Map.delete("")
  end

end
