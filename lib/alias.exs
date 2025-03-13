
# alias 지시자
# alias는 모듈에 별칭을 생성한다
# 주 목적은 타이핑할 수고를 줄이는 것이다

defmodule Example do
  def compile_and_go(source) do
    alias My.Other.Module.Parser, as: Parser
    alias My.Other.Module.Runner, as: Runner
    source
    |> Parser.parse()
    |> Runner.execute()
  end
end

# as: 파라미터는 기본적으로 모듈명의 마지막 부분으로 지정되므로
# 앞의 alias는 다음과 같이 줄여 쓸 수 있다
alias My.Other.Module.Parser
alias My.Other.Module.Runner

# 더 줄여 쓸 수도 있다
alias My.Ohter.Module.{Parser, Runner}
