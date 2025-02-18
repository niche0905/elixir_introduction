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
    a = 2

    [a, b, a] = [1, 2, 3] # X
    [a, b, a] = [1, 1, 2] # X
    a = 1                 # O
    ^a = 2                # O
    ^a = 1                # X
    ^a = 2 - a            # X
  end
end
