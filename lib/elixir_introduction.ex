defmodule ElixirIntroduction do
  def hello do
    # 얼랭 라이브러리 함수 호출
    # 얼랭과 엘릭서의 컨벤션은 약간다르다
    # 얼랭은 변수 이름은 대문자로 시작하고 아톰은 소문자로 시작한다
    # 얼랭의 timer 모듈은 얼랭에서 timer라는 아톰 그대로 사용할 수 있지만
    # 엘릭서에서는 :timer 라고 써야한다
    # timer 모듈에 tc라는 함수를 엘릭서에서 사용하려면 :timer.tc와 같이 써야한다

    # 실수를 총 세 글자, 소수점 아래 한자리까지 허용하는 필드에 출력한다고 하면
    # 얼랭에는 이를 지원하는 함수 io 모듈의 format이라는 함수를 찾을 수 있다
    :io.format("The number is ~3.1f~n", [5.678]) # The number is 5.7
    # 얼랭의 모듈명을 엘리것의 아톰으로 바꾸어 호출하면 된다
  end
end
