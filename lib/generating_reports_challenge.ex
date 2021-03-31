defmodule GeneratingReportsChallenge do
  alias GeneratingReportsChallenge.Parser

  @months [
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

  def call(file_name) do
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

    hours_per_month =
      Map.put(
        hours_per_month,
        name,
        put_sub_maps(hours_per_month[name], set_month(month), quantity)
      )

    hours_per_year =
      Map.put(hours_per_year, name, put_sub_maps(hours_per_year[name], year, quantity))

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp put_sub_maps(map, key, quantity) do
    Map.put(map, key, map[key] + quantity)
  end

  defp set_month(number_month) do
    case number_month in 1..12 do
      true -> Enum.at(@months, number_month - 1)
      _ -> {:error, "Month invalid"}
    end
  end

  defp report_acc do
    months = Enum.into(@months, %{}, &{&1, 0})
    year = Enum.into(2016..2020, %{}, &{&1, 0})

    hours_per_month = Enum.into(@user_list, %{}, &{&1, months})
    all_hours = Enum.into(@user_list, %{}, &{&1, 0})
    hours_per_year = Enum.into(@user_list, %{}, &{&1, year})

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  def build_report(all_hours, hours_per_month, hours_per_year) do
    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end
end
