
# Collcetable
# Enumerable 프로토콜은 자료현 내의 데이터를 순회해 저장된 값을 얻어오는 데 사용한다
# Collectable 프로토콜은 그 반대 역할, 즉 값을 추가해 컬렉션을 만드는 데 사용한다
# 모들 컬렉션 자료형에 값을 추가할 수 있는 것은 아니다
# 이를테면 범위 타입에는 항목을 추가할 수 없다

# Collectable 프로토콜의 API는 저수준 구현이어서 일반적으로는 Enum.into 함수난 곧 살펴 볼 컴프리헨션 문을 사용한다

# 예를 들어 범위 타입의 값을 빈 리스트에 넣으려면 다음처럼 한다
Enum.into(1..5, [])
#=> [1, 2, 3, 4, 5]

# 리스트가 비어 있지 않으면 새롭게 들어오는 항목들이 리스트의 뒤에 따라붙는다
Enum.into(1..5, [100, 101])
#=> [100, 101, 1, 2, 3, 4, 5]

# 출력 스트림에도 Collectable 프로토콜이 구현되어 있다
# 다음 코드는 콘솔 입력을 콘솔 출력으로 지연 복사한다
Enum.into(IO.stream(:stdio, :line), IO.stream(:stdio, :line))
#=>
# 123456
# 123456
# 5555
# 5555
# 안녕하세요
# 안녕하세요
