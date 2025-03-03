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
    rnd = &(Float.round(&1, &2))  # &Float.round/2
    rnd = &(Float.round(&2, &1))  # #Function<...>
  end
end
