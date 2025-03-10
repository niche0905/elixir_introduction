defmodule Calculate do
  # 1부터 n까지 정수의 합을 재귀적으로 구하는 sum(n) 함수를 구현하고 실행해라
  def sum(0), do: 0
  def sum(n), do: n + sum(n-1)
  # iex "lib\Calculate.exs"
  # iex> Calculate.sum(10)

  # 음이 아닌 두 정수의 최대공약수를 찾는 gcd(x, y) 함수를 구현해라
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end
