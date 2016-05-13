defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r{[,-\s]|(\B[a-z])}, "")
    |> String.upcase
  end
end
