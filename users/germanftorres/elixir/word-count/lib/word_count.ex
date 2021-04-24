defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.


  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    # replace all symbols except dashes \p{Pd}
    |> String.split(~r/[\s\p{Pe}\p{Pf}\p{Pi}\p{Po}\p{Ps}\p{Pc}\p{S}]/iu, trim: true)
    # |> String.split(~r/[^\p{L}0-9-]+/u, trim: true)
    # |> String.split(~r/[[:alnum:]-]+/u, trim: true)

    |> Enum.frequencies()
  end
end
