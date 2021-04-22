defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/[\s_,.:!?&@$%^]+/, trim: true)
    |> Enum.reduce(
      %{},
      fn word, acc ->
        case acc do
          %{^word => c} -> %{acc | word => c + 1}
          _ -> Map.put(acc, word, 1)
        end
      end
    )
  end
end
