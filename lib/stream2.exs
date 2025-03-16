
IO.puts(File.open!("/urs/share/dict/words"))
|> IO.stream(:line)
|> Enum.max_by(&String.length/1)

# 이 코드의 핵심은 IO.stream 함수이다
# 이 함수는 IO 디바이스(열려져 있는 파일)를 줄 단위로 값을 제공하는 스트림으로 바꿔준다
# 이는 매우 유용해서 두 함수를 줄인 단축 함수도 있다
