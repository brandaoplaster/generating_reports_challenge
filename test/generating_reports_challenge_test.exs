defmodule GeneratingReportsChallengeTest do
  use ExUnit.Case

  describe "call/1" do
    test "call the report" do
      file_name = "gen_test.csv"

      response = GeneratingReportsChallenge.call(file_name)

      expected_response = %{
        "all_hours" => %{
          "Cleiton" => 12,
          "Daniele" => 16,
          "Danilo" => 7,
          "Diego" => 8,
          "Giuliano" => 14,
          "Jakeliny" => 14,
          "Joseph" => 3,
          "Mayk" => 19,
          "Rafael" => 7,
          "Vinicius" => 8
        },
        "hours_per_month" => %{
          "Cleiton" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 4,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 8,
            "setembro" => 0
          },
          "Daniele" => %{
            "abril" => 7,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 1,
            "maio" => 8,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Danilo" => %{
            "abril" => 1,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 6,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Diego" => %{
            "abril" => 0,
            "agosto" => 4,
            "dezembro" => 1,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 3
          },
          "Giuliano" => %{
            "abril" => 1,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 9,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 4,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Jakeliny" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 8,
            "junho" => 0,
            "maio" => 0,
            "março" => 6,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Joseph" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 3,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Mayk" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 5,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 7,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 7
          },
          "Rafael" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 7,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Vinicius" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 8,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          }
        },
        "hours_per_year" => %{
          "Cleiton" => %{2016 => 3, 2017 => 0, 2018 => 0, 2019 => 0, 2020 => 9},
          "Daniele" => %{2016 => 5, 2017 => 3, 2018 => 7, 2019 => 0, 2020 => 1},
          "Danilo" => %{2016 => 0, 2017 => 0, 2018 => 1, 2019 => 6, 2020 => 0},
          "Diego" => %{2016 => 3, 2017 => 4, 2018 => 0, 2019 => 1, 2020 => 0},
          "Giuliano" => %{2016 => 0, 2017 => 3, 2018 => 0, 2019 => 6, 2020 => 5},
          "Jakeliny" => %{2016 => 0, 2017 => 8, 2018 => 0, 2019 => 6, 2020 => 0},
          "Joseph" => %{2016 => 0, 2017 => 3, 2018 => 0, 2019 => 0, 2020 => 0},
          "Mayk" => %{2016 => 7, 2017 => 8, 2018 => 0, 2019 => 4, 2020 => 0},
          "Rafael" => %{2016 => 0, 2017 => 7, 2018 => 0, 2019 => 0, 2020 => 0},
          "Vinicius" => %{2016 => 0, 2017 => 0, 2018 => 0, 2019 => 0, 2020 => 8}
        }
      }

      assert response == expected_response
    end
  end
end
