
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
