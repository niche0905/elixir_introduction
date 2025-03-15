
people = [
  %{ name: "Grumpy",    height: 1.24 },
  %{ name: "Dave",      height: 1.88 },
  %{ name: "Dopey",     height: 1.32 },
  %{ name: "Shaquille", height: 2.16 },
  %{ name: "Sneezy",    height: 1.28 }
]

defmodule HotelRoom do

  # 맵의 패턴 매칭

  def book(%{name: name, height: height})
  when height > 1.9 do
    IO.puts("Need extra-long bed for #{name}")
  end

  def book(%{name: name, height: height})
  when height < 1.3 do
    IO.puts("Need low shower controls for #{name}")
  end

  def book(person) do
    IO.puts("Need regular bed for #{person.name}")
  end

end

people |> Enum.each(&HotelRoom.book/1)

# Need low shower controls for Grumpy
# Need regular bed for Dave
# Need regular bed for Dopey
# Need extra-long bed for Shaquille
# Need low shower controls for Sneezy

%{ 2 => state} = %{ 1 => :ok, 2 => :error}
# %{ 1 => :ok, 2 => :error}

state
# :error

# 잘못된 방식
%{ item => :ok } = %{ 1 => :ok, 2 => :error}
# (CompileError) 변수에 키값을 담을 수는 없다


data = %{ name: "Dave", state: "TX", likes: "Elixir" }
# %{  likes: "Elixir", name: "Dave", state: "TX" }

# 변수에 저장된 키로는 매칭 할 수 있다
for key <- [ :name, :likes] do
  %{ ^key => value } = data
  value
end
# ["Dave", "Elixir"]


# 맵 수정하기
# 맵 전체를 순회하지 않더라도 맵에 새 키-값 쌍을 추가하거나 기존 값을 수정할 수 있다
# 하지만 엘릭서의 기본 불변 데이터로 맵을 수정해 얻는 결과는 새로운 맵이 된다
# new_map = %{ old_map | key => value, ... }
# 위 문법을 사용하면 기존 맵의 복사본에 파이프 기호 뒤에 있는 항목들을 갱신한 맵이 반환된다
m = %{ a: 1, b: 2, c: 3 }
# %{a: 1, b: 2, c: 3}
m1 = %{ m | b: "two", c: "three" }
# %{a: 1, b: "two", c: "three"}
m2 = %{ m1 | a: "one" }
# %{a: "one", b: "two", c: "three"}

# 위 파이프 문법은 원래 있던 key에 대한 수정을 하는 것이다
# 새 항복을 추가할 수는 없다
# 추가를 위해선 Map.put/3 를 써야 한다 (기존 맵, key, value) 로 추정

# Map.put_new와 put의 차이 put_new는 추가하려는 키가 이미 존재하면 변화가 없고
# put은 기존의 값을 덮어써버린다
