defmodule MyList do
  # 엘릭서의 리스트의 길이를 구하는 법 (재귀 함수)
  # 리스트의 재귀적 특성을 이해하기 위해서 길이를 알 수 있는 함수를 구현
  # 파라미터 식별자 앞에 언더스코어(_)를 붙여 사용하지 않을 변수를 설정해야 경고가 안생긴다
  def len([]), do: 0
  def len([ _head | tail ]), do: 1 + len(tail)
end
