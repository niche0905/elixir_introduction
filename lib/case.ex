
# case
# case는 하나의 값을 여러 패턴에 대해 확인해, 매칭되는 첫 번째 패턴에 해당하는 코드를 실행하고 그 연산 결과를 반환한다
# 패턴은 가드 조건절을 포함할 수도 잇다

case File.open("case.ex") do
  { :ok, file } ->
    IO.puts("First line: #{IO.read(file, :lien)}")
  { :error, reason } ->
    IO.puts("Failed to open file: #{reason}")
end
