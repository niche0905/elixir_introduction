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
    # 인자 3개를 받는 함수를 만들어보자
    # 앞의 인자 2개가 모두 0이면 "FizzBuzz"
    # 첫 인자만 0이면 "Fizz"
    # 두 번째 인자만 0이면 "Buzz"
    # 위 상황에 해당하지 않으면 세 번째 인자를 반환하는 함수
    fizzbuzz = fn
        (0, 0, _) -> "FizzBuzz"
        (0, _, _) -> "Fizz"
        (_, 0, _) -> "Buzz"
        (_, _, r) -> r
        end

    # rem(a, b) 연산자는 a를 b로 나눈 나머지를 반환한다.
    # n이라는 정수를 받아 위에서 만든 fizzbuzz 함수에 rem(n, 3), rem(n,5), n을 인자로 전달하는 함수를 만들어라
    func = fn (n) -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

    # 정답 확인
    IO.puts(func.(10))   # Buzz
    IO.puts(func.(11))   # 11
    IO.puts(func.(12))   # Fizz
    IO.puts(func.(13))   # 13
    IO.puts(func.(14))   # 14
    IO.puts(func.(15))   # FizzBuzz
    IO.puts(func.(16))   # 16
  end
end
