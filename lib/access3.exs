
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
