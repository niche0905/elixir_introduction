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
    # 연산자
    a === b # 값과 자료형이 모두 값으면 true
    a !== b # 값과 자료형이 하나라도 같지 않으면 true
    a == b  # 값이 같으면 true
    a != b  # 값이 다르면 true
    a > b   # 값의 대소비교
    a >= b
    a < b
    a <= b
    # 다른 자료형의 비교의 경우
    # 숫자 < 아톰 < 레퍼런스 < 포트 < 프로세스 ID < 튜플 < 맵 < 리스트 < 바이너리

    # 인자로 true false를 받는다
    a or b  # a가 true 이면 true, 아니면 b (하나만 이라도 true면 true와 조금 다른 의미)
    a and b # a가 false 이면 false, 아니면 b
    not a   # a가 true이면 false, 아니면 true

    # 모든 타입의 인자를 받는다 nil이나 false가 아닌 값은 모두 참으로 해석
    a || b  # a가 참으로 간주되면 a, 아니면 b
    a && b  # a가 참으로 간주되면 b, 아니면 a
    !a      # a가 참으로 간주되면 false, 아니면 true

    a + b   # a+b
    a - b   # a-b
    a * b   # a*b
    a / b   # a/b (실수가 나올 수 있음)
    div(a, b) # 정수 나눗셈 (정수만 나옴)
    rem(a, b) # 나머지 연산 (정수만 나옴)

    binary1 <> binary2  # 두 바이너리를 연결한다
    list1 ++ list2      # 두 리스트를 연결한다
    list1 -- list2      # 리스트 1의 복사본에서 리스트 2의 값들을 제거한다

    a in enum   # a가 enum(리스트, 범위, 맵 등의 컬렉션)에 포함되는지 확인한다
                # enum이 맵인 경우 a는 {키, 값} 튜플이어야 한다다

  end
end
