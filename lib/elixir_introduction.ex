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
    l = &length/1
    IO.puts(l.([1, 3, 5, 7]))
    len = &Enum.count/1
    IO.puts(len.([1, 2, 3, 4]))
    m = &Kernel.min/2
    IO.puts(m.(99, 88))
  end
end
