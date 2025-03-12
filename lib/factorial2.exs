defmodule Factorial2 do
  def of(0), do: 1
  def of(n) when is_integer(n) and n > 0 do
    n * of(n-1)
  end
  # 비교 연산자
  # ==, !=, ===, !==, >, <, <=, >=
  # 이진 및 부정 연산자
  # or, and, not (!, ||, &&는 안됨)
  # 산술 연산자
  # +, -, *, /
  # 연결 연산자
  # <>, ++ (왼쪽이 리터럴일때 문자열 연결, 리스트 연결)
  # in 연산자 (컬렉션 또는 범위 안에 들어가는지)
  # 타입 확인 함수 (is_atom, is_binary, is_integer 등등)
  # 기타 함수들 (abs(number), bit_size(bitstring), div(number, number))
end
