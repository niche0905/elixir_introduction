
# 패턴 매칭을 이용

defmodule Fizzbuzz3 do
  def upto(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)

  defp fizzbuzz(n), do: _fizzword(n, rem(n, 3), rem(n, 5))

  defp _fizzword(_n, 0, 0), do: "FizzBuzz"
  defp _fizzword(_n, 0, _), do: "Fizz"
  defp _fizzword(_n, _, 0), do: "Buzz"
  defp _fizzword(n, _, _), do: n
end

# cond가 어떻게 동작하는지 소개하였지만
# cond 대신 패턴 매칭을 이용하는 편이 나을 때가 많다
