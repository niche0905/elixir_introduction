
cast = %{
  buttercup: %{
    actor: {"Robin", "Wright"},
    role: "princess"
  },
  westley: %{
    actor: {"Carey", "Elwes"},
    role: "farm boy"
  }
}

# 딕셔너리 타입(맵, 구조체)에는 key와 key! 함수를 사용할 수 있다

IO.inspect(get_in(cast, [Access.key(:westley), :actor, Access.elem(1)]))
# "Elwes"

IO.inspect(get_and_update_in(cast, [Access.key(:buttercup), :role], fn (val) -> {val, "Queen"} end))
# {"princess",
#  %{
#    buttercup: %{actor: {"Robin", "Wright"}, role: "Queen"},
#    westley: %{actor: {"Carey", "Elwes"}, role: "farm boy"}
#  }}


# Access.pop은 맵이나 키워드 리스트에서 특정 키가 있는 항목을 제거한다
# 그리고 제거한 키에 저장되어 있던 값, 해당 항목을 제거한 나머지 데이터로 이루어진 튜플을 반환한다
# 원본 딕셔너리에 지정한 키가 존재하지 않으면 nil을 반환한다
# 스택의 pop 액션과 이름은 같지만 전혀 관련 없다

Access.pop(%{name: "Elixir", creator: "Valim"}, :name)
# {"Elixir", %{creator: "Valim"}}

Access.pop([name: "Elixir", creator: "Valim"], :name)
# {"Elixir", [creator: "Valim"]}

Access.pop(%{name: "Elixir", creator: "Valim"}, :year)
# {nil, %{name: "Elixir", creator: "Valim"}}
