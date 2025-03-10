defmodule Times do
  def double(n), do: n * 2

  # 주어진 숫자에 3을 곱해 반환하는 triple 함수를 구현하라
  def triple(n), do: n * 3

  # 파일을 컴파일 하는 두 가지 방법을 모두 사용해 IEx에서 실행
  # iex times.exs <- cd 또는 경로까지
  # iex> c "times.exs" <- 해당 파일이 바로 있는 곳에서 iex 실행 시 가능

  # 주어진 숫자의 4배의 값을 반환하는 quadruple 함수를 구현하라 (double 함수를 이용하여)
  def quadruple(n), do: double(double(n))
end
