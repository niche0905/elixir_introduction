
defmodule Example do

  # 모듈 속성
  # 모듈 안에서 같은 속성의 값을 여러 번 설정 할 수도 있다
  # 함수에서 모듈 속성에 접근하는 경우 속성의 값은 함수가 정의될 당시의 값으로 설정된다다

  @attr "one"
  def first, do: @attr
  @attr "two"
  def second, do: @attr
end

IO.puts("#{Example.second}, #{Example.first}")  # two, one

# 모듈 속성은 일반 변수와 많이 다르다
# 컴파일 시점에 값이 결정되어 런타임에서는 값을 변경할 수 없다
# 엘릭서에서의 모듈 속성은 설정과 메타데이터 용도로만 사용하기를 권장한다
