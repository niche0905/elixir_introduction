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
    list1 = [3, 2, 1]
    IO.puts(list1) # [3, 2, 1]
    list2 = [4 | list1]
    IO.puts(list2) # [4, 3, 2, 1]
    # 이때 데이터의 복사가 아닌 레퍼런스를 사용
  end
end
