defmodule Times do
  # 기명 함수
  # 코드의 구조를 나누기 위해 모듈로 묶어서 정의
  # 아래 double 함수의 아리티는 1로 double/1로 쓸 수 있다
  def double(n) do
    n * 2
  end
  # 기명 함수의 식별은
  # 함수의 이름과 파라미터의 개수(아리티)로 식별한다
  # 관련이 없는 두 함수에는 같은 이름을 붙이지 않는 편이 좋다
end
