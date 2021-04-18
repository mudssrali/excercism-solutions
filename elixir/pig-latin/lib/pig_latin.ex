defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    if phrase |> String.starts_with?(["a", "e", "i", "o", "u"]) do
      phrase <> "ay"
    else
      {consonant, rem} = phrase |> String.split_at(1)

      if rem |> String.starts_with(["h", "qu"]) 

      rem <> consonant <> "ay"
    end
  end
end
