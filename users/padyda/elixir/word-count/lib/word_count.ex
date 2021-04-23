defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do

    crop_list  = ["!", "#", ":", "&", "@", "$", "%", "^", ",", "."]
    space_list = ["_"]

    sentence
    |> String.downcase
    |> String.replace(crop_list, "")
    |> String.replace(space_list, " ")
    |> String.split
    |> Enum.frequencies

  end
end
