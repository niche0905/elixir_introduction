
# Stream
# 엘릭서에서의 Enum 모듈은 탐욕스러운(greedy) 연산을 한다
# 즉, 컬렉션을 전달하면 그 ㄱ컬렉션의 모든 값들에 연산을 수행한다
# 그리고 수행한 연산의 결과는 일반적으로 새로운 컬렉션이 된다

[1, 2, 3, 4, 5]
|> Enum.map(&(&1*&1)) # [1, 4, 9, 16, 25]
|> Enum.with_index  # [{1, 0}, {4, 1}, {9, 2}, {16, 3}, {25, 4}]
|> Enum.map(fn {value, index} -> value - index end) # [1, 3, 7, 13, 21]
|> IO.inspect

# 결과물을 만들어내기까지 4개의 리스트를 생성한다
