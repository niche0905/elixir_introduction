
# 연습문제
# case를 이용해 FizzBuzz 예제를 다시 작성해보자

defmodule FizzBuzz do

  def upto(n) when n > 0, 1..n |> fizzbuzz/1

  defp fizzbuzz(n)
  case n do
    rem(n, 3) == 0 and rem(n, 5) == 0 ->
      "FizzBuzz"
    rem(n, 3) == 0 ->
      "Fizz"
    rem(n, 5) == 0 ->
      "Buzz"
    true ->
      n
  end
end

# 지금까지 cond, case, 함수 분리를 이용해 총 세 가지 방법으로 FizzBuzz를 구현했다
# 어느 방법이 문제를 가장 잘 표현할까 생각해보자

# 잘 모르겠다

# 엘릭서에 내장된 함수들은 두 가지 형식을 가지는 경우가 많다
# xxx 형식 함수는 성공하면 {:ok, data}, 실패하면 {:error, reason}을 반환하고
# xxx! 형식 함수는 성공하면 데이터를 반환하고 실패하면 예외를 발생시킨다
# 단일 파라미터를 받는 ok! 함수를 구현해 보자
# 파라미터가 {:ok, data}이면 data를 반환하고
# 그렇지 않으면 파라미터의 정보를 담아 예외를 발생시켜야 한다
# 호출 예는 다음과 같다
# file = ok!(File.open("somefile"))

def ok!({:ok, data}), do: data
def ok!({:error, reason}), do: raise("Failed #{reason}")
