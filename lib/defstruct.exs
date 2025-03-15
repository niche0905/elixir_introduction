
defmodule Attendee do
  alias ElixirLS.LanguageServer.Server.InvalidParamError
  # 구조체를 모듈 안에 정의하는 이유
  # 구조체에 특화된 연산이 필요하기 때문이다

  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts("Very cheap badge for #{name}")
  end

  def print_vip_badge(%Attendee{}) do
    raise("missing name for badge")
  end

end

# 구조체를 다루기 위해 같은 모듈에 정의된 함수를 호출한다
# 구조체는 다형성을 구현할 때 매우 중요한 개념이다

# iex(1)> a1 = %Attendee{name: "Dave", over_18: true}
# %Attendee{name: "Dave", paid: false, over_18: true}
# iex(2)> Attendee.may_attend_after_party(a1)
# false
# iex(3)> a2 = %Attendee{a1 | paid: true}
# %Attendee{name: "Dave", paid: true, over_18: true}
# iex(4)> Attendee.may_attend_after_party(a2)
# true
# iex(5)> Attendee.print_vip_badge(a2)
# Very cheap badge for Dave
# :ok
# iex(6)> a3 = %Attendee{}
# %Attendee{name: "", paid: false, over_18: true}
# iex(7)> Attendee.print_vip_badge(a3)
# ** (RuntimeError) missing name for badge
