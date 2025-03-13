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
    # 함수
    # 데이터를 변경하는 것을 수행하는 함수는 엘릭서의 핵심이 된다
    # 변수에 바인딩하여 사용하는 익명 함수를 지금까지 다루어보았다
  end

  # defp 매크로로 프라이빗 함수를 정의할 수 있다
  # 모듈 내애서만 호출할 수 있다
  # 하나의 함수를 일부는 public, 일부는 private으로 설정 할 수 없다
  # 고로 다음은 잘못된 코드이다
  def fun(a) when is_list(a), do: true
  defp fun(a), do: false
end
