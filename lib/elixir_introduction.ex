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
    a = 1
    IO.puts(a)  # 1
    [1, ^a, 3] = [1, 2, 3]
    IO.puts(a)  # 2
    # 기존의 값을 무시하고 새로 매칭하는 경우
  end
end
