
# import 지시자
# import는 다른 모듈의 함수와 매크로를 현재 스코프로 가져온다
# 코드에서 측정 모듈을 자주 사용할 때 import를 사용해서 가져오면 모듈명을 반복하는 수고를 덜 수 있다

defmodule Example do
  def func1 do
    List.flatten([1, [2, 3], 4])
  end
  def func2 do
    improt List, only: [flatten: 1]
    flatten([5, [6, 7], 8])
  end
end

# import의 전체 문법은 다음과 같다
# import Module [, only:|except: ]
# only: 나 except: 뒤에 함수명: 인자 쌍의 리스트를 넣어주면 된다
# 가능한 적은 스코프에서 import를 사용하고
# only:를 이용해 필요한 함수만 임포트하기를 권장한다
# only:에 :functions나 :macros 아톰을 지정해 함수만, 혹은 매크로만 임포트 할 수도 있다
