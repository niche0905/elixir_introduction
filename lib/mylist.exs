defmodule MyList do
  # 엘릭서의 리스트의 길이를 구하는 법 (재귀 함수)
  # 리스트의 재귀적 특성을 이해하기 위해서 길이를 알 수 있는 함수를 구현
  # 파라미터 식별자 앞에 언더스코어(_)를 붙여 사용하지 않을 변수를 설정해야 경고가 안생긴다
  def len([]), do: 0
  def len([ _head | tail ]), do: 1 + len(tail)

  # 리스트 재귀 함수
  # 원소 제곱
  def square([]), do: []
  def square([head | tail]), do: [head*head | square(tail)]

  # 원소 상수 합
  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]

  # map 함수
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  # iex(1)> MyList.map([1,2,3,4], fn (n) -> n+1 end)
  # [2, 3, 4, 5]
  # iex(2)> MyList.map([1,2,3,4], &(&1 + 1))
  # [2, 3, 4, 5]
  # iex(3)> MyList.map([1,2,3,4], fn (n) -> n > 2 end)
  # [false, false, true, true]
end
