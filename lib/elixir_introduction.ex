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
    # 불변성으로 멀티스레드 환경에서 문제가 일어날 수 있는 상황을
    # 불변 데이터로 막을 수 있다
    # 불변 데이터는 확실한 데이터로 신뢰할 수 있는 결과를 가진다
    # 원본에 영향을 미치지 않기 때문에
  end
end
