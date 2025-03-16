
cast = [
  %{
    character: "Buttercup",
    actor: {"Robin", "Wright"},
    role: "princess"
  },
  %{
    character: "Westley",
    actor: {"Carey", "Elwes"},
    role: "farm boy"
  }
]


# 튜플에는 elem 함ㅅ후를 사용할 수 있다

IO.inspect(get_in(cast, [Access.all(), :actor, Access.elem(1)]))
# ["Wright", "Elwes"]

IO.inspect(get_and_update_in(cast, [Access.all(), :actor, Access.elem(1)], fn val -> {val, String.reverse(val)} end))
# {["Wright", "Elwes"],
#  [
#    %{character: "Buttercup", actor: {"Robin", "thgirW"}, role: "princess"},
#    %{character: "Westley", actor: {"Carey", "sewlE"}, role: "farm boy"}
#  ]}
