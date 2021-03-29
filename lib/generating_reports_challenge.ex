defmodule GeneratingReportsChallenge do
  alias GeneratingReportsChallenge.Parser

  def build(file_name) do
    file_name
    |> Parser.parse_file()
    |> Enum.map(fn line -> IO.inspect(line) end)
  end

end
