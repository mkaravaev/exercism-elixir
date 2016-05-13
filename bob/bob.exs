defmodule Bob do
  def hey(info) do
    cond do
      String.ends_with?(info, "?") -> "Sure."
      String.strip(info) == "" -> "Fine. Be that way!"
      String.upcase(info) != info && String.ends_with?(info, ["!", "."]) || only_numbers?(info)  -> "Whatever."
      yell?(info) == true -> "Whoa, chill out!"
      info -> "Whatever."
    end
  end

  defp yell?(info) do
    String.upcase(info) == info || String.ends_with?(info, ["!"]) 
  end

  def only_numbers?(info) do
    try do
      String.replace(info, ", ", "")
      |>String.to_integer
      |>is_number
    rescue
      ArgumentError -> false
    end
  end
end
