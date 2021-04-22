defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna = to_string(dna)
    dna = String.replace(dna, "G", "x")
    dna = String.replace(dna, "C", "G")
    dna = String.replace(dna, "x", "C")
    dna = String.replace(dna, "T", "A")
    dna = String.replace(dna, "A", "U")
    dna = to_char_list(dna)
  end
end
