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
    1..100    # 1~100 [1, 100] 모두 포함
    1..100//2 # 1~100인데 2씩 증가해 1, 3, 5, 7, ... 이 된다
  end
end
