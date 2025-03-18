
# cond 매크로로 여러 조건을 연속해서 확인할 수 있다 (C++의 switch 문?)

defmodule FizzBuzz do

  def upto(n) when n > 0, do: _upto(1, n, [])

  defp _upto(_current, 0, result), do: Enum.reverse(result)
  defp _upto(current, left, result) do
    next_answer =
      cond do
        rem(current, 3) == 0 and rem(current, 5) == 0 ->
          "FizzBuzz"
        rem(current, 3) == 0 ->
          "Fizz"
        rem(current, 5) == 0 ->
          "Buzz"
        true ->
          current
      end
    _upto(current + 1, left - 1, [next_answer | result])
  end

end

# 이 구현에는 작은 문제가 있는데
# 나중에 계산한 값이 리스트의 앞에 오기에 연산이 끝날때 reserse를 하였다
