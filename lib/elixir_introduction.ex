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
    # 함수에서 패턴 매칭
    swap = fn {a, b} -> {b, a} end
    swap.({6, 8})       # {8, 6}
  end
end
