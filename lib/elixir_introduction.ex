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
    [a, 2, b] = list
    IO.puts(a)  # 1
    IO.puts(b)  # 3
    # 패턴 매칭 사례

    # 아래의 경우 패턴 매칭 실패
    # list [1, 2, 3]
    # [a, 1, b] = list error
    # 좌변과 우변이 매칭되지 않으므로
  end
end
