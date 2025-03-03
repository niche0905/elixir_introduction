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
    list = [1, 3, 5, 7, 9]
    Enum.map(list, fn elem -> elem * 2 end)     # [2, 6, 10, 14, 18]
    Enum.map(list, fn elem -> elem * elem end)  # [1, 9, 25, 49, 81]
    Enum.map(list, fn elem -> elem > 6 end)     # [false, false, false, true, true]
  end
end
