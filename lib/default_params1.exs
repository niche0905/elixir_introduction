defmodule DefaultParams1 do
  def func(p1, p2 \\ 123) do
    IO.inspect([p1, p2])
  end
  def func(p1, 99) do
    IO.puts("you said 99")
  end
  # 기본 파리미터를 가지는 함수에 여러 구현을 정의한 경우
  # Compile warning이 발생한다
end
