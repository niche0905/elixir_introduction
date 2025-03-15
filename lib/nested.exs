
# 중첩된 딕셔너리 구조
# 여러 딕셔너리 타입 자료형을 사용해서 키와 값을 연결할 수 있다
# 딕셔너리 타입 역시 그 값이 될 수 있다

# 아래 버그 제보 시스템의 예제를 살펴보자
# 버그 제보를 자료구조로 표현하면 다음과 같다

defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

# 간단한 버그 제보 구조체를 하나 생성해보자
# iex> report = %BugReport{owner: %Customer{name: "Dave", company: "Pragmatic"}, details: "broken"}
# %BugReport{
#   owner: %Customer{name: "Dave", company: "Pragmatic"},
#   details: "broken",
#   severity: 1
# }

# owner의 필드 값은 Customer라는 구조체다
# 이렇게 중첩된 필드에도 온점(.)을 통해 접근할 수 있다
# iex> report.owner.company
# "Pragmatic"

# 만약 버그 제보자의 회사명이 틀렸을 경우 변경하는 방법이다
# iex> report = %BugReport{report | owner: %Customer{ report.owner | company: "PragProg" }}
# %BugReport{
#   owner: %Customer{name: "Dave", company: "PragProg"},
#   details: "broken",
#   severity: 1
# }

# 너무 복잡해진 코드가 보인다
# 사실 엘릭서는 중첩된 딕셔너리에 쉽게 접근하도록 해주는 함수들이 있다
# 그중 하나 put_in에 대해서 알아보자
# put_in은 중첩된 자료구조 내에 값을 저장해준다
# iex> put_in(report.owner.company, "PragProg")
# %BugReport{
#   owner: %Customer{name: "Dave", company: "PragProg"},
#   details: "broken",
#   severity: 1
# }
# 위 함수는 큰 차이는 없고 긴 코드를 줄여주는 매크로일 뿐이다

# update_in 함수는 자료구조 내의 특정 값에 함수를 적용한다
# iex> update_in(report.owner.name, &("Mr. " <> &1))
# %BugReport{
#   owner: %Customer{name: "Mr. Dave", company: "PragProg"},
#   details: "broken",
#   severity: 1
# }
# get_in과 get_and_update_in 등 다양한 함수들이 있다


# 구조체가 아닌 경우 함수 사용법은 다음과 같다
# 맵이나 키워드 리스트의 경우 아톰 키를 사용해서 접근할 수도 있다
# iex> report = %{owner: %{name: "Dave", company: "Pragmatic"}, severity: 1}
# %{owner: %{name: "Dave", company: "Pragmatic"}, severity: 1}
# iex> put_in(report[:owner][:company], "PragProg")
# %{owner: %{name: "Dave", company: "PragProg"}, severity: 1}
# iex> update_in(report[:owner][:name], &("Mr. " <> &1))
# %{owner: %{name: "Mr. Dave", company: "Pragmatic"}, severity: 1}
