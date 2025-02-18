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
    list = [1, 2, [3, 4, 5]]
    [a, b, c] = list
    [d, e, f] = c
    IO.puts(a)
    IO.puts(b)
    IO.puts(c)
    IO.puts(d)
    IO.puts(e)
    IO.puts(f)
    # 더 복잡한 경우 패턴 매칭 양상
  end
end
