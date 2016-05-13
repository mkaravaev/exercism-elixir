defmodule Words do
  #@doc ""
  #Count the number of words in the sentence.

  def count(words) when is_list(words) do
    Enum.reduce(words, %{}, &update_count/2)
  end

  def count(sentence) do
    sentence
    |> String.replace(~r/!|&|@|\$|%|\^|&|:|\,/, "")
    |> String.replace("  ", " ")
    |> String.downcase
    |> String.split(~r/,|_| /)
    |> count
  end

  def update_count(word, acc) do
    Map.update acc, word, 1, &(&1 + 1)
  end
end

