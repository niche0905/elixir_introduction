defmodule Times do
  # 기명 함수
  # 실제 기본 문법
  def duoble(n), do: n * 2

  # 여러 줄의 코드를 묶어 do: 사용
  def greet(greeting, name), do: (
    IO.puts(greeting)
    IO.puts("How're you doing, #{name}")
  )
end
