defmodule ElixirIntroduction do
  def hello do
    # |> 파이프라인 연산자
    (1..10) |> Enum.map(&(&1*&1)) |> Enum.filter(&(&1 <40))
    # 함수의 인자를 전달할 때 괄호를 써야한다
    # 그렇지 않으면 함수를 축약할 때 쓰는 &와 파이프 연산자가 충돌한다
  end
end
