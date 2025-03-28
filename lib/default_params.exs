defmodule Example do
  # 기본 파라미터
  # 인자 뒤에 \\를 붙이고 값을 써 기본 인자의 값을 설정할 수 있다
  # 함수 호출 시 들어온 인자를 필수 파리미터와 개수를 비교 후
  # 필수 파라미터 개수 == 들어온 인자 수
  # => 필수 파라미터만 들어온 인자로 채우고 기본 값 설정
  # 필수 파리미터 개수 < 들어온 인자 수
  # => 필수 파라미터를 다 채우는데 남는 수는 왼쪽부터
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect([p1, p2, p3, p4])
  end
  # 오류 코드
  def func(p1, p2) do
    IO.inspect([p1, p2])
  end

  # Example.func("a", "b")
  # => ["a", 2, 3, "b"]
  # Example.func("a", "b", "c")
  # => ["a", "b", 3, "c"]
  # Example.func("a", "b", "c", "d")
  # => ["a", "b", "c", "d"]
end
