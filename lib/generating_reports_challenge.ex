defmodule GeneratingReportsChallenge do
  alias GeneratingReportsChallenge.Parser

  @available_month [
    "janeiro",
    "fevereiro",
    "março",
    "abril",
    "maio",
    "junho",
    "julho",
    "agosto",
    "setembro",
    "outubro",
    "novembro",
    "dezembro"
  ]

  @user_list [
    "Daniele",
    "Mayk",
    "Giuliano",
    "Cleiton",
    "Jakeliny",
    "Joseph",
    "Diego",
    "Rafael",
    "Vinicius",
    "Danilo"
  ]

  def build(file_name) do
    file_name
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report ->
      sum_hours(line, report)
    end)
  end

  defp sum_hours([name, quantity, _day, month, year], %{
         "all_hours" => all_hours,
         "hours_per_month" => hours_per_month,
         "hours_per_year" => hours_per_year
       }) do
    all_hours = Map.put(all_hours, name, all_hours[name] + quantity)
    hours_per_month = Map.put(hours_per_month, name, sum_hours_month(hours_per_month[name], month, quantity))
    hours_per_year = Map.put(hours_per_year, name, sum_hours_month(hours_per_year[name], year, quantity))

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end

  defp sum_hours_month(map, month, quantity) do
    Map.put(map, month, map[month] + quantity)
  end

  defp report_acc do
    month = Enum.into(1..12, %{}, &{&1, 0})
    year = Enum.into(2016..2020, %{}, &{&1, 0})

    hours_per_month = Enum.into(@user_list, %{}, &{&1, month})
    all_hours = Enum.into(@user_list, %{}, &{&1, 0})
    hours_per_year = Enum.into(@user_list, %{}, &{&1, year})

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end
end
