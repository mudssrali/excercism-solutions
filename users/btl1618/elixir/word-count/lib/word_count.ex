defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.

  #### FUNCTIONS USED

  Enum.reduce(t(), any(), (element(), acc() -> acc())) :: acc()

  Invokes fun for each element in the enumerable with the accumulator.

  _______________________

  Map.update(
          map(),
          key(),
          default :: value(),
          (existing_value :: value() -> updated_value :: value())
        ) :: map()

  Updates the key in map with the given function.

  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase # downcase all words for case-insensitivity
    |> String.replace(~r"[^a-zA-ZÀ-ÿ0-9 -]", " ") # regex to include all alphanumerical characters, accented letters included
    |> String.split # create list of all words in string
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
  end
end
