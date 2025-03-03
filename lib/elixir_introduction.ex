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
    s = &"bacon and #{&1}"
    IO.puts(s.("custard"))

    match_end = &~r/.*#{&1}$/
    IO.puts("cat" =~ match_end.("t"))
    IO.puts("cat" =~ match_end.("!"))
  end
end
