defmodule ElixirIntroduction do
  @moduledoc """
  Documentation for `ElixirIntroduction`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirIntroduction.hello()
      :world

  """
  def hello do
    # 날짜와 시간
    d1 = Date.new(2018, 12, 25)
    IO.puts(d1) # {:ok, ~D[2018-12-25]}

    {:ok, d1} = Date.new(2018, 12, 25)
    d2 = ~D[2018-12-25]
    IO.puts(d1 == d2) # true

    IO.puts(Date.day_of_week(d1)) # 2
    IO.puts(Date.add(d1, 7))  # ~D[2019-01-01]
    inspect(d1, struct: false)
  end
end
