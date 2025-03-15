
defmodule Swapper do
  # 복잡한 리스트 패턴
  # 조인 연산자(|)는 연산자 왼쪽에 여러 값을 둘 수 있다
  # [1, 2, 3 | [4, 5, 6]]

  def swap([]), do: []
  def swap([a, b | tail]), do: [b, a | swap(tail)]
  def swap([_]), do: raise("Can't swap a list with an odd number of elements")
end
