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
    # 엘릭서의 리스트
    IO.puts([1, 2, 3] ++ [4, 5, 6])     # [1, 2, 3, 4, 5, 6]
    IO.puts([1, 2, 3, 4] -- [2, 4])     # [1, 3]
    IO.puts(1 in [1, 2, 3, 4])          # true
    IO.puts("wombat" in [1, 2, 3, 4])   # false
    # 엘릭서에서 리스트는 linked list로 random access에는 아쉬운 성능이지만
    # 순회에서는 강점을 가지고 가장ㅇ 중요한 재귀적으로 리스트를 정의하는 방식이
    # 엘릭서 프로그래밍의 핵심이다. (불변의 데이터를 가리키는 것으로 해결하기에)
  end
end
