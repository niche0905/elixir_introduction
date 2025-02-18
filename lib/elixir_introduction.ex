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
    # 엘릭서는 여러 프로세스를 사용하는 코드를 작성
    # 프로세스마다 각자의 힙을 가지는 분산되어 있음
    # 이때 GC(가비지 컬렉터)가 보다 빠르게 일을 끝마칠 수 있음
    # 프로세스가 끝날 때 모든 데이터가 사라짐
  end
end
