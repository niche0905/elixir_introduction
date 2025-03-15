
authors = [
  %{ name: "Jose", language: "Elixir" },
  %{ name: "Matz", language: "Ruby" },
  %{ name: "Larry", language: "Perl" }
]

languages_with_an_r = fn (:get, collection, next_fn) ->
  for row <- collection do
    if String.contains?(row.language, "r") do
      next_fn.(row)
    end
  end
end

IO.inspect(get_in(authors, [languages_with_an_r, :name]))
#=> ["Jose", nil, "Larry"]

# 동적 버전 get_in과 get_and_update_in을 활용한 트릭
# 키에 함수를 전달하면 함수가 실행되며 해당 자리에 맞는 값을 반환한다

# 위 코드가 어떻게 돌아가는지 정확하게 이해하진 못하였다
# get_in/2는 get_in(data, keys)인데
# data: 탐색할 데이터 구조 (맵, 리스트 등) <- 우리꺼에서는 리스트(안에 맵)
# keys: 탐색할 키 목록(일반적으로 :key 형태이지만 위 코드처럼 함수도 사용 가능)

# get_in/2 호출 시 :get 명령어와 함께 collection(리스트)과 next_fn(다음 처리 함수, :name 인듯..?)이 전달됨
# for row <- collection 을 통해 리스트의 각 원소를 순회함
# row.language에 "r"이 포함되어 있으면 next_fn.(row)를 실행
# next_fn.(row) 는 :name.(row) == row[:name]
