
# 연습문제
# 라이브러리나 리스트 컴프리헨션 문을 사용하지 않고 Enum 모듈의 all?, each, filter, split, take 함수를 직접 만들어보아라
# filter를 구현하려면 if 문이 필요하다

defmodule MyEnum do

  # all?
  def all?([], func), do: raise("empty list")
  def all?([single], func), do: func.(single)
  def all?([head | tail], func), do: func.(head) and all?(tail, func)

  def gpt_all?([], func), do: true  # 빈 리스트의 경우 일반적으로 true
  def gpt_all?([single], func), do: func.(single)
  def gpt_all?([head | tail], func), do: func.(head) && gpt_all?(tail, func) # truthy/falsy 개념이 적용되는 &&가 적합하다

  # each
  def each([], func), do: []
  def each([head | tail], func), do: [func.(head) | each(tail, func)]

  def gpt_each([], func), do: :ok # 내가 위에 구현한 것은 Enum.map 이였다
  def gpt_each([head | tail], func) do
    func.(head)
    gpt_each(tail, func)
  end

  # filter
  def filter([], func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail)]
    else
      filter(tail)
    end
  end

  def gpt_filter([], func), do: []
  def gpt_filter([head | tail], func) do
    if func.(head) do
      [head | gpt_filter(tail, func)] # 오타 있음
    else
      gpt_filter(tail, func) # 오타 있음
    end
  end

  # split 못 품
  def split(list, n), do: split_helper(list, n)

  def split_helper([], n), do: []
  def split_helper([head | tail], 0), do: [head | tail]
  def split_helper(list, n), do: {split_helper(list, n)}

  def gpt_split(list, 0), do: {[], list}
  def gpt_split([], _n), do: {[], []}
  def gpt_split([head | tail], n) when n > 0 do # n 음수 입력 방지용(없으면 무한루프)
    {left, right} = gpt_split(tail, n - 1)
    {[head | left], right}
  end

  # take
  def take([], n), do: []
  def take(list, 0), do: []
  def take([head | tail], n) when do: [head | take(tail, n - 1)]

  def gpt_take([], n), do: []
  def gpt_take(_list, 0), do: []  # 사용 안할 변수 와일드 카드
  def gpt_take([head | tail], n) when n > 0,  do: [head | gpt_take(tail, n - 1)]  # 오타 + 마찬가지로 음수 방지용

end


# flatten(list) 함수를 구현해보아라
# 이 함수는 리스트를 받는데, 리스트는 하위 리스트를 포함할 수 있으며, 하위 리스트는 또 다른 하위 리스트를 포함할 수 있다
# 리스트의 최대 깊이에는 제한이 없다
# 반환되는 값은 각 요소를 순서대로 늘어 놓은 1차원 리스트여야 한다

defmodule MyList do
  def flatten([]), do: []
  def flatten([head | tail]) when is_list(head), do: [flatten(head) | flatten(tail)]
  def flatten([head | tail]), do: [head | flatten(tail)]

  def gpt_flatten([]), do: []
  def flagpt_flattentten([head | tail]) when is_list(head), do: flatten(head) ++ flatten(tail)  # 중첩 리스트가 해결 되게 ++ 연산자 사용 ... 기존의 코드는 중첩 리스트가 해결되지 않았음
  def gpt_flatten([head | tail]), do: [head | gpt_flatten(tail)]
end
