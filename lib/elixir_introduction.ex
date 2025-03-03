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
    Enum.map([1, 2, 3, 4], &(&1 + 1))   # [2, 3, 4, 5]
    Enum.map([1, 2, 3, 4], &(&1 * &1))  # [1, 4, 9, 16]
    Enum.map([1, 2, 3, 4], &(&1 < 3))   # [true, true, false, false]
  end
end
