
people = [
  %{ name: "Grumpy",    height: 1.24 },
  %{ name: "Dave",      height: 1.88 },
  %{ name: "Dopey",     height: 1.32 },
  %{ name: "Shaquille", height: 2.16 },
  %{ name: "Sneezy",    height: 1.28 }
]

IO.inspect(for person = %{ height: height } <- people, height > 1.5, do: person)
# [%{name: "Dave", height: 1.88}, %{name: "Shaquille", height: 2.16}]

# for 문을 통한 순회와 필터링
# for를 이용해 여러 사람의 데이터를 순회하며, 항몽을 필터링하는데 필요한 height 값을 추출하기 위해 구조 분해를 사용한다
# for 컴프리헨션 문을 이용했다다
