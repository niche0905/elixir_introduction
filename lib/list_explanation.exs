
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
end
