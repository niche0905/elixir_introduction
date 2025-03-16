
# 스트림
# 스트림을 만드는 간단한 예를 보자

s = Stream.map([1, 3, 5, 7], &(&1 + 1))
# #Stream<[enum: [1, 3, 5, 7], funs: [#Function<49.82544474/1 in Stream.map/2>]]>

# 같은 리스트에 Enum.map을 호출하면 [2, 4, 6, 8]이라는 결과를 즉시 얻을 수 있다
# 위 예제에서는 대신 스트림 값이 반환되는데, 이 스트림에는 컬렉션이 수행해야 할 연산의 명세가 포함된다
# 그렇다면 스트림에서 실제 결과를 받아오려면 어떻게 해야 할까?
# 스트림을 컬렉션으로 생각하고 Enum 모듈의 함수에 넣으면 된다

Enum.to_list(s)
# [2, 4, 6, 8]

# 스트림 역시 Enumerable 프로토콜을 구현한 타입이므로 Stream 모듈의 함수에 컬렉션 대신 스트림을 전달할 수도 있다
# 따라서 스트림을 조합해 사용할 수 있다

squares = Stream.map([1,2,3,4], &(&1 * &1))
# #Stream<[enum: [1, 2, 3, 4], funs: [#Function<49.82544474/1 in Stream.map/2>]]>
plus_ones = Stream.map(squares, &(&1 + 1))
# #Stream<[
#   enum: [1, 2, 3, 4],
#   funs: [#Function<49.82544474/1 in Stream.map/2>,
#    #Function<49.82544474/1 in Stream.map/2>]
# ]>
odds = Stream.filter(plus_ones, fn x -> rem(x, 2) == 1 end)
# #Stream<[
#   enum: [1, 2, 3, 4],
#   funs: [#Function<49.82544474/1 in Stream.map/2>,
#    #Function<49.82544474/1 in Stream.map/2>,
#    #Function<39.82544474/1 in Stream.filter/2>]
# ]>
Enum.to_list(odds)
# [5, 17]
