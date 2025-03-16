
# Enum
# Enum은 엘릭서에서 가장 많이 사용하는 라이브러리일 것이다
# 컬렉션을 순회하고, 특정 항목을 필터링하고, 합치거나 나누는 등 컬렉션을 다루는 여러 연산에서 사용한다
# Enum 모듈을 주로 사용하는 작업은 다음과 같다

# 다른 컬렉션을 리스트로 바꾸기 (변환)
list = Enum.to_list(1..5)
# [1, 2, 3, 4, 5]

# 컬렉션 연결하기(병합)
Enum.concat([1,2,3], [4,5,6])
# [1, 2, 3, 4, 5, 6]
Enum.concat([1,2,3], 'abc')
# [1, 2, 3, 97, 98, 99]

# 기존 컬렉션의 각 값에 함수를 적용해 새 컬렉션 만들기(생성)
Enum.map(list, &(&1 * 10))
# [10, 20, 30, 40, 50]
Enum.map(list, &String.duplicate("*", &1))
# ["*", "**", "***", "****", "*****"]

# 위치 또는 조건으로 값을 선택하기(접근)
Enum.at(10..20, 3)
# 13
Enum.at(10..20, 20)
# nil
Enum.at(10..20, 20, :no_one_here)
# :no_one_here
Enum.filter(list, &(&1 > 2))
# [3, 4, 5]
require Integer
Enum.filter(list, &Integer.is_even/1)
# [2, 4]
Enum.reject(list, &Integer.is_even/1)
# [1, 3, 5]

# 값 정렬 비교하기(정렬)
Enum.sort(["there", "was", "a", "crooked", "man"])
# ["a", "crooked", "man", "there", "was"]
Enum.sort(["there", "was", "a", "crooked", "man"], &(String.length(&1) <= String.length(&2)))
# ["a", "was", "man", "there", "crooked"]
Enum.max(["there", "was", "a", "crooked", "man"])
# "was"
Enum.max_by(["there", "was", "a", "crooked", "man"], &String.length/1)
# "crooked"

# 컬렉션 나누기(분해)
Enum.take(list, 3)
# [1, 2, 3]
Enum.take_every(list, 2)
# [1, 3, 5]
Enum.take_while(list, &(&1 < 4))
# [1, 2, 3]
Enum.split(list, 3)
# {[1, 2, 3], [4, 5]}
Enum.split_while(list, &(&1 < 4))
# {[1, 2, 3], [4, 5]}
# 컬렉션의 값을 합쳐 문자열로 만들기
Enum.join(list)
# "12345"
Enum.join(list, ", ")
# "1, 2, 3, 4, 5"

# 명제
Enum.all?(list, &(&1 < 4))
# false
Enum.any?(list, &(&1 < 4))
# true
Enum.member?(list, 4)
# true
Enum.empty?(list)
# false

# 컬렉션 합치기
Enum.zip(list, [:a, :b, :c])
# [{1, :a}, {2, :b}, {3, :c}]
Enum.with_index(["once", "upon", "a", "time"])
# [{"once", 0}, {"upon", 1}, {"a", 2}, {"time", 3}]

# 각 항목을 합쳐 하나의 값으로 만들기
Enum.reduce(1..100, &(&1 + &2))
# 5050
Enum.reduce(["now", "is", "the", "time"], fn word, longest ->
  if String.length(word) > String.length(longest) do
    word
  else
    longest
  end
 end)
# "time"
Enum.reduce(["now", "is", "the", "time"], 0, fn word, longest ->
  if String.length(word) > longest,
  do: String.length(word),
  else: longest
 end)
# 4

# 트럽프 카드 다루기
import Enum
deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit, rank]
# [~c"C2", ~c"D2", ~c"H2", ~c"S2", ~c"C3", ~c"D3", ~c"H3", ~c"S3", ~c"C4", ~c"D4",
#  ~c"H4", ~c"S4", ~c"C5", ~c"D5", ~c"H5", ~c"S5", ~c"C6", ~c"D6", ~c"H6", ~c"S6",
#  ~c"C7", ~c"D7", ~c"H7", ~c"S7", ~c"C8", ~c"D8", ~c"H8", ~c"S8", ~c"C9", ~c"D9",
#  ~c"H9", ~c"S9", ~c"CT", ~c"DT", ~c"HT", ~c"ST", ~c"CJ", ~c"DJ", ~c"HJ", ~c"SJ",
#  ~c"CQ", ~c"DQ", ~c"HQ", ~c"SQ", ~c"CK", ~c"DK", ~c"HK", ~c"SK", ~c"CA", ~c"DA",
#  ...]
deck |> shuffle |> take(13)
# [~c"DA", ~c"C7", ~c"CQ", ~c"S8", ~c"D3", ~c"ST", ~c"SK", ~c"SJ", ~c"D7", ~c"S9",
#  ~c"S7", ~c"C5", ~c"DT"]
hands = deck |> shuffle |> chunk_every(13)
# [
#   [~c"SA", ~c"D9", ~c"DT", ~c"S4", ~c"C9", ~c"C5", ~c"C4", ~c"CA", ~c"SJ",
#    ~c"H6", ~c"DA", ~c"DK", ~c"CT"],
#   [~c"H9", ~c"D6", ~c"D7", ~c"HA", ~c"C7", ~c"S3", ~c"C8", ~c"C2", ~c"HJ",
#    ~c"SK", ~c"D4", ~c"ST", ~c"H4"],
#   [~c"HQ", ~c"D3", ~c"D8", ~c"H5", ~c"CQ", ~c"D5", ~c"C3", ~c"H7", ~c"DQ",
#    ~c"S6", ~c"DJ", ~c"S8", ~c"HT"],
#   [~c"H2", ~c"CK", ~c"S7", ~c"D2", ~c"CJ", ~c"H3", ~c"S5", ~c"HK", ~c"C6",
#    ~c"H8", ~c"S2", ~c"SQ", ~c"S9"]
# ]
