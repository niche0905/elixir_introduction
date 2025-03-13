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

# 모듈 중첩
# 엘릭서의 모듈 중첩은 허상이다
# 모든 모듈은 최상위에 정의된다
# 코드상으로 모듈을 중첩해서 정의하더라도
# 엘릭서는 외부 모듈명을 내부 모듈명 앞에 온점(.)으로 연결해 모듈명을 삼는다
# 즉, 중첩된 모듈을 직접 정의할 수도 있다는 뜻이다
defmodule Mix.Tasks.Doctest do
  def run do
    IO.puts("run call")
  end
end

Mix.Tasks.Doctest.run()
# 이는 모듈 Mix와 Mix.Tasks.Docetst 사이에 특별한 관계가 없음을 의미한다
