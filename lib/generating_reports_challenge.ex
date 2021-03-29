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
      sum_all_hours(line, report)
    end)
  end

  defp sum_all_hours([name, quantity, day, month, year], %{"users" => users} = report) do
    users = Map.put(users, name, users[name] + quantity)
    %{"users" => users}
  end

  defp report_acc do
    _year = Enum.into(@available_month, %{}, &{&1, 0})
    users = Enum.into(@user_list, %{}, &{&1, 0})

    %{"users" => users}
  end
end
