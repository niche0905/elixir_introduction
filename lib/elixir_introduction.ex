defmodule ElixirIntroduction do
  def hello do
    # 모듈은 당신이 정의한 것들에 네임스페이스를 만들어준다
    # 모듈은 함수만이 아니라 매크로, 구조체, 프로토콜, 다른 모듈까지도 포함할 수 있다
    # 모듈 안에 정의된 함수를 모듈 밖에서 참조하려면 함수명 앞에 모듈 이름을 붙여야 한다
  end
end

defmodule Mod do
  def func1 do
    IO.puts("in func1")
  end
  def fucn2 do
    func1()
    IO.puts("in func2")
  end
end

# 모듈 중첩

defmodule Outer do
  defmodule Inner do
    def inner_func do
      IO.puts("inner_func call")
    end
  end

  def outer_func do
    IO.puts("outer_func call")
    Inner.inner_func()
    # or Outer.Inner.inner_func()
  end
end

Outer.outer_func()
Outer.Inner.inner_func()
