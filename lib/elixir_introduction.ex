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
    1 = a
    # 2 = a error 매칭
    # 매칭으로 변수의 변숫값을 변경하려면 변수가 좌변에
    # 우변의 있는 변수는 상수로 취급
  end
end
