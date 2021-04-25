defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    words = String.replace(sentence,~r/(?=[^\w-\p{L}])[\p{P}\p{S}]/u," ")
    |> String.replace(~r/[_]/, " ")
    |> String.downcase()
    |> String.split(~r{\s} , trim: true)
    Enum.reduce(words, %{}, fn x,acc -> Map.put(acc,x,occurs(words,x)) end)

  end

  defp occurs(words,word) do
      Enum.count(words, fn x -> x === word end)
  end


end
