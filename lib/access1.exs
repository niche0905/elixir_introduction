
cast = [
  %{
    character: "Buttercup",
    actor: %{
      first: "Robin",
      last: "Wright"
    },
    role: "princess"
  },
  %{
    character: "Westley",
    actor: %{
      first: "Cary",
      last: "Elwes"
    },
    role: "farm boy"
  }
]


# Access 모듈
# Access 모듈에는 get_in, get_and_update_in의 파리머터로 사용 가능한 함수 몇가지가 정의되어있다
# 이 함수들은 자료구조를 탐색할 때 원하는 항목을 찾아내는 일종의 필터 역할을 한다
# all과 at함수는 리스트에만 사용할 수 있다
# all은 리스트의 모든 항몽을 반환하며
# at은 0번째부터 시작해 n번쨰 값을 반환한다

IO.inspect(get_in(cast, [Access.all(), :character]))
#=> ["Buttercup", "Westley"]

IO.inspect(get_in(cast, [Access.at(1), :role]))
#=> "farm boy"

IO.inspect(get_and_update_in(cast, [Access.all(), :actor, :last], fn (val) -> {val, String.upcase(val)} end))
#=> {["Wright", "Elwes"],
#    [
#      %{
#        character: "Buttercup",
#        actor: %{first: "Robin", last: "WRIGHT"},
#        role: "princess"
#      },
#      %{
#        character: "Westley",
#        actor: %{first: "Cary", last: "ELWES"},
#        role: "farm boy"
#      }
#    ]}
