
defmodule MapExplanation do
  map = %{ name: "Dave", likes: "Programming", where: "Dallas"}
  # %{ name: "Dave", likes: "Programming", where: "Dallas"}

  Map.keys(map)
  # [:likes, :name, :where]

  Map.values(map)
  # ["Programming", "Dave", "Dallas"]

  map[:name]
  # "Dave"

  map.name
  # "Dave"

  map1 = Map.drop(map, [:where, :likes])
  # %{name: "Dave"}

  map2 = Map.put(map, :also_likes, "Ruby")
  # %{ also_likes: "Ruby", likes: "Programming", name: "Dave", where: "Dallas"}

  Map.keys(map2)
  # [:also_likse, :likse, :name, :where]

  Map.has_key?(map1, :where)
  # false

  { value, updated_map } = Map.pop(map2, :also_likse)
  # {"Ruby", %{ likes: "Programming", name: "Dave", where: "Dallas"}}

  Map.equal?(map, updated_map)
  # true

  # 맵
  # 맵은 랜덤 액세스가 가능한 키-값 자료구조로, 크기와 관계없이 좋은 성능을 낸다
  # 맵 모듈의 API를 사용할 수 있다

end
