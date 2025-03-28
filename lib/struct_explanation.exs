
defmodule Subsciber do
  # 구조체
  # 맵에 특정 키만 허용해야 하는지, 키에 기본값이 있어야 하는지, 타입이 필요하다던지 하면 구조체를 사용하면 된다
  # 필드가 정해져 있고, 그 필드들에 기본값이 있고, 저장된 데이터뿐 아니라 맵의 타입 자체로도 패턴 매칭이 가능하다
  # 구조체는 사실 맵의 어떤 제한된 형태를 모듈로 감싼 것에 지나지 않는다
  # 타입에 상관없이 모든 값을 키로 사용할 수 있는 맵과 달리 구조체의 키는 항상 아톰이여야 한다
  # 도한 모듈의 이름이 그 구조체의 타입이 된다
  # 모듈 내에서 defstruct 매크로를 사용해 구조체의 필드를 정의할 수 있다

  defstruct name: "", paid: false, over_18: true
end

s1 = %Subsciber{}
# %Subsciber{name: "", paid: false, over_18: true}
s2 = %Subsciber{ name: "Dave" }
# %Subsciber{name: "Dave", paid: false, over_18: true}
s3 = %Subsciber{ name: "Mary", paid: true }
# %Subsciber{name: "Mary", paid: true, over_18: true}

# 구조체는 맵을 만들 때와 똑같은 문법으로 만든다
# %와 {} 사이에 모듈(구조체)의 이름을 넣기만 하면 된다
# 구조체 내의 필드에 접근할 때는 온점(.)이나 패턴 매칭을 사용하면 된다

s3.name
# "Mary"
%Subsciber{name: a_name} = s3
# %Subsciber{name: "Mary", paid: true, over_18: true}
a_name
# "Mary"

# 구조체를 수정하는 문법도 맵을 수정하는 문법처럼 |를 사용한다

s4 = %Subsciber{ s3 | name: "Marie" }
# %Subsciber{name: "Marie", paid: true, over_18: true}
