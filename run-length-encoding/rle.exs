defmodule RunLengthEncoder do
  require IEx
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """

  @spec encode(String.t) :: String.t
  def encode(string) do
    list_compact(string)
      |> add_count()
      |> to_string()
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    extract_number_with_letter(string)
      |> decode_letter_sequence()
      |> to_string()
  end

  defp decode_letter_sequence(list) do
    for n <- list, do: [populate_letter(n)] 
  end

  defp populate_letter(list) do
    String.duplicate(extract_letter(list), parse_int(list))
  end

  defp extract_letter(n) do
    List.last(n) |> String.last
  end

  defp parse_int(list) do
    Regex.run(~r{\d*}, first_string(list))
    |> to_string
    |> String.to_integer()
  end

  defp first_string(list) do
    List.first(list)
  end

  defp list_compact(string) do
    Regex.scan(~r/((.)\2*)/, string, capture: :first)
  end

  defp extract_number_with_letter(string) do
    Regex.scan(~r{(\d*\w)}, string, capture: :first)
  end

  defp add_count(list) do
    for n <- list, do: [string_el_size(n) | List.first(n) |> String.at(0)]
  end

  defp string_el_size(list) do
    List.last(list) |> String.length() |> to_string()
  end
end

