
defmodule Example do

  # 모듈 속성
  # 엘릭서의 각 모듈은 메타데이터를 가질 수 있다
  # 메타데이터를 이루는 각 항목을 모듈 속성이라 부르고, 각각은 이름을 가진다
  # 모듈 내에서는 속성 이름 앞에 @를 붙여서 해당 값에 접근한다
  # 속성에 값을 설정하려면 다음처럼 한다
  # 이 구문은 모듈의 최상위에서만 사용할 수 있다
  # 다시 말해, 함수 정의 내에서는 모듈 속성 값을 설정할 수 없고,
  # 값을 읽는 것만 가능하다

  @name 3
  @author "Dave Thomas"

  def get_author do
    @author
    # @author "niche" 불가능
  end
end

IO.puts("Exaple was written by #{Example.get_author}")
