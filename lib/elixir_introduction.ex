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
    times_2 = fn n -> n * 2 end
    apply = fn (fun, value) -> fun.(value) end
    IO.puts(apply.(times_2, 6))
  end
end
