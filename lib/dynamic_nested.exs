
# 동적으로 (런타임에) 중첩된 자료구조에 접근하기
# 방금까지 사용한 중첩 데이터 접근 함수들은 모두 매크로이다
# 즉 컴파일 타입에 동작하며, 그로 인한 제약이 몇 가지 있다
# - 함수 호출에 전달할 수 있는 키가 정적이다
# - 키를 함수 파라미터로 전달할 수 없다
# 이러한 제약들은 매크로가 컴파일 타입에 파라미터를 코드로 바꿔 쓰므로 자연스럽게 따라온 결과이다
# 제약을 없애기 위해 함수들은 별도의 파라미터로 키의 리스트를 받기도 한다
# 이 방식은 내부적으로 매크로를 호출하지 않고 함수를 호출하므로 연산을 동적으로 수행한다

# 매크로와 함수를 호출하는 파라미터는 각각 다음과 같다
#                   매크로 호출           함수 호출
# get_in            없음                  (딕셔너리, 키 리스트)
# put_in            (경로, 저장할 값)     (딕셔너리, 키 리스트, 저장할 값)
# update_in         (경로, 실행할 함수)   (딕셔너리, 키 리스트, 실행할 함수)
# get_and_update_in (경로, 실행할 함수)   (딕셔너리, 키 리스트, 실행할 함수)


nested = %{
  buttercup: %{
    actor: %{
      first: "Robin",
      last: "Wright"
    },
    role: "princess"
  },
  westley: %{
    actor: %{
      first: "Cart",
      last: "Elwis"   # 오타!!
    },
    role: "farm boy"
  }
}

IO.inspect(get_in(nested, [:buttercup]))
#=> %{actor: %{first: "Robin", last: "Wright"}, role: "princess"}

IO.inspect(get_in(nested, [:buttercup, :actor]))
#=> %{first: "Robin", last: "Wright"}

IO.inspect(get_in(nested, [:buttercup, :actor, :first]))
#=> "Robin"

IO.inspect(put_in(nested, [:westley, :actor, :last], "Elwes"))
#=> %{
#     buttercup: %{actor: %{first: "Robin", last: "Wright"}, role: "princess"},
#     westley: %{actor: %{first: "Cart", last: "Elwes"}, role: "farm boy"}
#   }
