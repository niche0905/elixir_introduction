defmodule DefaultParams2 do
  def func(p1, p2 \\ 123)

  def func(p1, p2) when is_list(p1) do
    "You said #{p2} with a list"
  end

  def func(p1, p2) do
    "You passed in #{p1} and #{p2}"
  end

  # 기본 파라미터를 사용하려면 기본값 파라미터가 있는 함수를 본문 없이 정의하고 (프로토타입)
  # 나머지 함수들은 기본값 없이 정의하면 된다
  # 처음에 정의한 기본값이 모든 함수 호출에 적용된다
end
