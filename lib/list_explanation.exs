
defmodule ListExplanation do
  # 리스트 연결
  [1, 2, 3] ++ [4, 5, 6]
  # => [1, 2, 3, 4, 5, 6]

  # 평탄화
  List.flatten([[[1], 2], [[[3]]]])
  # => [1, 2, 3]

  # 폴딩 (reduce와 비슷하지만 방향이 있다)
  List.foldl([1, 2, 3], "", fn value, acc -> "#{value}(#{acc})" end)
  # => "3(2(1()))"
  List.foldr([1, 2, 3], "", fn value, acc -> "#{value}(#{acc})" end)
  # => "1(2(3()))

  # 리스트 중간을 수정 (무거운 연산)
  list = [1, 2, 3]
  List.replace_at(list, 2, "buckle my shoe")
  # => [1, 2, "buckle my shoe"]

  # 리스트 안의 튜플에 접근하기
  kw = [{:name, "Dave"}, {:likes, "Programming"}, {:where, "Dallas", "TX"}]
  List.keyfind(kw, "Dallas", 1)
  # => {:where, "Dallas", "TX"}
  List.keyfind(kw, "TX", 2)
  # => {:where, "Dallas", "TX"}
  List.keyfind(kw, "TX", 1)
  # => nil
  List.keyfind(kw, "TX", 1, "No city called TX")
  "No city called TX"
  kw = List.keydelete(kw, "TX", 2)
  # => [{:name, "Dave"}, {:likes, "Programming"}]
  kw = List.keyreplace(kw, :name, 0, {:first_name, "Dave"})
  # => [{:first_name, "Dave"}, {likes: "Programming"}]

  # 리스트
  # 리스트는 연속된 값을 다룰 때 자연스럽게 사용하게 되는 자료구조 (컬렉션) 이다
  # 데이터를 파싱할 때, 값의 컬랙션을 다룰 때, 연속적인 함수 호출의 결과를 기록할 때 등에 리스트를 사용한다
  # 리스트는 익숙해질 때까지 시간을 들일 가치가 있다
end
