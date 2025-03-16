
# 연습문제
# 라이브러리나 리스트 컴프리헨션 문을 사용하지 않고 Enum 모듈의 all?, each, filter, split, take 함수를 직접 만들어보아라
# filter를 구현하려면 if 문이 필요하다

defmodule MyEnum do

  # all?
  def all?([], func), do: raise("empty list")
  def all?([single], func), do: func.(single)
  def all?([head | tail], func), do: func.(head) and all?(tail, func)

  # each
  def each([], func), do: []
  def each([head | tail], func), do: [func.(head) | each(tail, func)]

  # filter
  def filter([], func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail)]
    else
      filter(tail)
    end
  end

  # split 못 품
  def split(list, n), do: split_helper(list, n)

  def split_helper([], n), do: []
  def split_helper([head | tail], 0), do: [head | tail]
  def split_helper(list, n), do: {split_helper(list, n)}

  # take
  def take([], n), do: []
  def take(list, 0), do: []
  def take([head | tail], n) when do: [head | take(tail, n - 1)]

end


# flatten(list) 함수를 구현해보아라
# 이 함수는 리스트를 받는데, 리스트는 하위 리스트를 포함할 수 있으며, 하위 리스트는 또 다른 하위 리스트를 포함할 수 있다
# 리스트의 최대 깊이에는 제한이 없다
# 반환되는 값은 각 요소를 순서대로 늘어 놓은 1차원 리스트여야 한다

defmodule MyList do
  def flatten([]), do: []
  def flatten([head | tail]) when is_list(head), do: [flatten(head) | flatten(tail)]
  def flatten([head | tail]), do: [head | flatten(tail)]
end
