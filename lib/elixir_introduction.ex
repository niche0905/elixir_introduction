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
    divrem = &{div(&1, &2), rem(&1, &2)}
    IO.puts(divrem.(13, 5)) # {2, 3}
  end
end
