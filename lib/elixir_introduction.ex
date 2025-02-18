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
    a = [1, 2, 3]       # O
    b = 4               # O
    4 = c               # X
    [d, e] = [1, 2, 3]  # X
    f = [[1, 2, 3]]     # O
    [g] = [[1, 2, 3]]   # O
    [[h]] = [[1, 2, 3]] # O
  end
end
