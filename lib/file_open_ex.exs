
# File.open이 성공하면 { :ok, file }이 반환되고 실패하면 { :error, reason }이 반환된다
# 따라서 파일을 열지 못할 가능성이 있으며 실패했을 때 다른 처리를 수행하게 하려면 다음처럼 구현할 수 있다

case File.open(user_file_name) do
  {:ok, file} ->
    process(file)
  {:error, message} ->
    IO.puts(:stderr, "Couldn't open #{user_file_name}: #{message}")
end

# 파일을 항상 열 수 있을 것으로 기대한다면 실패했을 때 예외를 발생시킬 수도 있다

case File.open(user_file_name) do
  {:ok, file} ->
    process(file)
  {:error, message} ->
    raise("Failed to open config file: #{message}")
end

# 또는 다음처럼 작성해서 실패했을 때 언어 수준에서 예외를 내도록 할 수도 있다

{:ok, file} = File.open("config_file")
process(file)

# 만약 파일을 열지 못해 첫 번째 줄의 패턴 매칭에 실패하면 엘릭서는 MatchError를 발생시킨다
# 실패 시 명시적으로 예외를 발생시키는 코드보다는 알아보기가 다소 어렵겠지만, 오류가 절대 발생하지 않아야 하는 경우에는 이정도면 충분하다
# 실패 했을 때 예외를 발생시켜야 하는 상황에는 File.open!을 사용하는 편이 낫다
# 함수면 뒤에 있는 느낌표는 컨벤션으로, 함수 실행이 실패하면 예외가 발생하며 그 예외에는 의미 있는 내용이 담겨 있다고 생각하면 된다
file = File.open!("config_file")
