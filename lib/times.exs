defmodule Times do
  # 기명 함수
  # do...end 문법은 개발자의 편의를 위한 문법이다
  # 일반적으로 한 줄짜리 코드 블록에는 do: 를
  # 여러 줄짜리 블록에는 do...end를 사용한다
  def duoble(n), do: n * 2

  # 여러 줄의 코드를 묶어 do: 사용
  def greet(greeting, name) do
    IO.puts(greeting)
    IO.puts("How're you doing, #{name}")
  end
end
