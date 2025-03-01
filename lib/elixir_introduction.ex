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
    # 함수
    my_sum = fn (a, b) -> a + b end
    IO.puts(my_sum.(1, 2))
  end
end
