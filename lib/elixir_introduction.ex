defmodule ElixirIntroduction do
  def hello do
    # 모듈의 이름
    # 모듈 이름은 하나의 아톰이다
    # 대문자로 시작하는 모듈 이름을 하나 쓰면
    # 엘릭서는 이를 Elixir. 가 앞에 붙은 아톰으로 바꾼다
    # IO 모듈은 Elixir.IO가 된다
    is_atom(IO) # true
    to_string(IO) # "Elixir.IO"
    :"Elixir.IO" === IO # true
    IO.puts(123)
    :"Elixir.IO".puts(123)

    # 다음과 같은 사용도 가능하다
    my_io = IO
    my_io.puts(123)
  end
end
