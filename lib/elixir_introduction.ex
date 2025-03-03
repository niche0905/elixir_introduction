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
    add_one = &(&1 + 1)
    IO.puts(add_one.(44))
    square = &(&1 * &1)
    IO.puts(square.(8))
    speak = &(IO.puts(&1))
    speak.("Hello")
  end
end
