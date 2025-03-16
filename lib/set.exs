
# 집합
# 집합은 MapSet 모듈에 구현되어 있다

set1 = 1..5 |> Enum.into(MapSet.new)
# MapSet.new([1, 2, 3, 4, 5])

set2 = 3..8 |> Enum.into(MapSet.new)
# MapSet.new([3, 4, 5, 6, 7, 8])

MapSet.member?(set1, 3)
# true

MapSet.union(set1, set2)
# MapSet.new([1, 2, 3, 4, 5, 6, 7, 8])

MapSet.difference(set1, set2)
# MapSet.new([1, 2])

MapSet.difference(set2, set1)
# MapSet.new([6, 7, 8])

MapSet.intersection(set2, set1)
# MapSet.new([3, 4, 5])
