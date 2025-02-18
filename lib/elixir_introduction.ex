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
    list = [1, 2, 3]
    [a, b, c] = list
    IO.puts(a)  # 1
    IO.puts(b)  # 2
    IO.puts(c)  # 3
    # 패턴 매칭 리스트의 경우
  end
end
