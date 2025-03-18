
# 제어문
# 엘릭서 코드는 명령형을 지양하고 선언형을 지향한다
# 작은 함수 여러개에 가드 조건절과 파라미터 패턴 매칭을 활용하면 다른 언어의 제어 구문을 대부분 대체할 수 있다
# 제어문보다 함수형 프로그래밍으로 해결할 수 있을지 먼저 고민해 보는 것이 함수형 프로그래밍이 주는 이점을 이해하는데 도움이 된다


# if와 unless
if 1 == 1, do: "true part", else: "false part"
# "true part"
if 1 == 2, do: "true part", else: "false part"
# "false part"

# 편의 문법
if 1 == 1 do
  "true part"
else
  "false part"
end

# unless
# if와 반대로 작동한다
unless 1 == 1, do: "error", else: "OK"
# "OK"
unless 1 == 2, do: "OK", else: "error"
# "OK"
