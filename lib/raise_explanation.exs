
# 예외
# 예외는 공식적으로 제어 구문이 아니다
# 절대 발생하지 않을 상황을 위해 만들어졌다

# raise 함수로 예외를 발생시킬 수 있다
raise("Giving up")
# ** (RuntimeError) Giving up
# 예외의 타입과 다른 속성을 raise에 함께 전달할 수도 있다
raise(RuntimeError)
# ** (RuntimeError) runtime error
raise(RuntimeError, message: "Override message")
# ** (RuntimeError) Override message

# 엘릭서에서의 예외는 자제하고 오류는 상위로 전파되어 관리 프로세스에 의해 처리되어야 한다
