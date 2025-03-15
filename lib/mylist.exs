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

  # reduce 함수
  def reduce([], value, _) do
    value
  end
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  # iex(1)> MyList.reduce([1,2,3,4,5], 0, &(&1 + &2))
  # 15
  # iex(2)> MyList.reduce([1,2,3,4,5], 1, &(&1 * &2))
  # 120

  # 연습문제

  # 리스트와 함수를 받는 mapsum 함수를 만들어보자
  # 이 함수는 리스트의 각 요소에 함수를 적용한 뒤, 그 결과를 모두 더한 값을 반환한다
  # 호출 예는 다음과 같다
  # iex> MyList.map([1, 2, 3], &(&1 * &1))
  # 14

  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def gpt_mapsum(list, func), do: reduce(list, 0, fn x, acc -> acc + func.(x) end)

  # max(list) 함수를 구현해보자
  # 이 함수는 리스트에서 가장 큰 값을 반환한다
  def max([]), do: 0
  def max([head | tail]) do
    max_el = max(tail)
    if (head > max_el) do
      head
    else
      max_el
    end
  end

  def gpt_max([]), do: raise(ArgumentError, message: "Cannot find max in an empty list")
  def gpt_max([single]), do: single
  def gpt_max([head | tail]), do: gpt_max(head, gpt_max(tail))

  defp gpt_max(a, b) when a > b, do: a
  defp gpt_max(_, b), do: b

  # 엘릭서에서 작은따옴표로 둘러싸인 문자열은 사실 각 문자 코드들의 리스트다 (문자 리스트)
  # 리스트의 각 요소에 n을 더하는 caesar(list, n) 함수를 만들어보자
  # 만약 더한 문자 코드의 값이 'z'를 넘어가면 'a'로 돌아가 이어서 세어주자

  def caesar([], _n), do: []
  def caesar([head | tail], n), do: [rem((head + n - ?a), 26) + ?a | caesar(tail, n)]
  # ?연산자가 유니코드 코드 포인터 (우리가 생각하는 아스키 값)을 알 수 있게 해주는 연산자이다

  def gpt_caesar([], _n), do: []
  def gpt_caesar([head | tail], n), do: [shift_char(head, n) | caesar(tail, n)]

  defp shift_char(char, shift) do
    rem((char + shift - ?a), 26) + ?a
  end

end
