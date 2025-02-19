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
    Regex.run(~r{[aeiou]}, "caterpillar")
    Regex.scan(~r{[aeiou]}, "caterpillar")
    Regex.split(~r{[aeiou]}, "caterpillar")
    Regex.replace(~r{[aeiou]}, "caterpillar", "*")
  end
end
