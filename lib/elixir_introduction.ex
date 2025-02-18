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
    [a, b, a] = [1, 2, 3] # X
    [c, d, c] = [1, 1, 2] # X
    [e, f, e] = [1, 2, 1] # O
  end
end
