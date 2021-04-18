defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
        translation_map = %{
        "UGU" => "Cysteine",
        "UGC" => "Cysteine",
        "UUA" => "Leucine",
        "UUG" => "Leucine",
        "AUG" => "Methionine",
        "UUU" => "Phenylalanine",
        "UUC" => "Phenylalanine",
        "UCU" => "Serine",
        "UCC" => "Serine",
        "UCA" => "Serine",
        "UCG" => "Serine",
        "UGG" => "Tryptophan",
        "UAU" => "Tyrosine",
        "UAC" => "Tyrosine",
        "UAA" => "STOP",
        "UAG" => "STOP",
        "UGA" => "STOP"
    }
    { result, _ } = rna
        |> to_charlist
        |> Enum.chunk_every(3)
        |> Enum.map(fn x -> x |> to_string end)
        |> Enum.reduce({[], ""}, fn(x, agg) ->

            p = Map.get(translation_map, x)
            
            {proteins, stop} = agg

            if p == nil do
              {[], "STOP"}
            else
              if p == "STOP" or stop === "STOP", do: {proteins, "STOP"}, else: { proteins ++ [p], stop}
            end

          end)

    if result |> length > 0, do: {:ok, result}, else: {:error, "invalid RNA"}

  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    translation_map = %{
        "UGU" => "Cysteine",
        "UGC" => "Cysteine",
        "UUA" => "Leucine",
        "UUG" => "Leucine",
        "AUG" => "Methionine",
        "UUU" => "Phenylalanine",
        "UUC" => "Phenylalanine",
        "UCU" => "Serine",
        "UCC" => "Serine",
        "UCA" => "Serine",
        "UCG" => "Serine",
        "UGG" => "Tryptophan",
        "UAU" => "Tyrosine",
        "UAC" => "Tyrosine",
        "UAA" => "STOP",
        "UAG" => "STOP",
        "UGA" => "STOP"
    }

    protien = Map.get(translation_map, codon)

    {:ok, protien}
  end
end
