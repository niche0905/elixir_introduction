defmodule Factorial3 do
  def of(0), do: 1
  def of(n) do
    if n < 0 do
      raise "factorial called on a negative number"
    else
      n * of(n-1)
    end
  end
  # 둘다 음수를 받으면 예외를 발생시키지만
  # fact3의 경우는 예외 출력을 설정할 수 있어서 더 좋아보이지만
  # fact2의 경우가 정의역이 음이아닌 정수임을 명시적으로 나타내어
  # 우리의 의도를 더 정확하게 나타내는 것은 fact3 코드이다
end
