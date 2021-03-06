defmodule GeneratingReportsChallenge.ParserTest do
  use ExUnit.Case

  alias GeneratingReportsChallenge.Parser

  describe "parse_file/1" do
    test "parse the file" do
      file_name = "gen_test.csv"

      response =
        file_name
        |> Parser.parse_file()
        |> Enum.map(& &1)

      expected_response = [
        ["Daniele", 7, 29, 4, 2018],
        ["Mayk", 4, 9, 12, 2019],
        ["Joseph", 3, 17, 3, 2017],
        ["Giuliano", 3, 13, 2, 2017],
        ["Cleiton", 1, 22, 6, 2020],
        ["Jakeliny", 8, 18, 7, 2017],
        ["Diego", 3, 11, 9, 2016],
        ["Rafael", 7, 1, 7, 2017],
        ["Vinicius", 8, 29, 7, 2020],
        ["Danilo", 1, 7, 4, 2018],
        ["Mayk", 1, 2, 12, 2017],
        ["Cleiton", 3, 20, 6, 2016],
        ["Giuliano", 6, 18, 2, 2019],
        ["Jakeliny", 6, 23, 3, 2019],
        ["Daniele", 5, 1, 5, 2016],
        ["Giuliano", 1, 2, 4, 2020],
        ["Daniele", 3, 5, 5, 2017],
        ["Daniele", 1, 26, 6, 2020],
        ["Mayk", 7, 28, 7, 2017],
        ["Mayk", 7, 3, 9, 2016],
        ["Danilo", 6, 28, 2, 2019],
        ["Diego", 4, 15, 8, 2017],
        ["Cleiton", 8, 3, 10, 2020],
        ["Giuliano", 4, 24, 5, 2020],
        ["Diego", 1, 10, 12, 2019]
      ]

      assert response == expected_response
    end
  end
end
