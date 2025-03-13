defmodule ElixirIntroduction do
  def hello do
    # 소수를 소수점 아래 두 자리까지의 문자열로 바꾸는 함수 [얼랭]
    :io_lib.format("~.2f", [5.12])
    # 운영체제의 환경 변수를 얻어오는 함수 [엘릭서]
    System.get_env("HOME")
    # 파일의 확장자를 반환하는 함수 [엘릭서]
    Path.extname("file.txt")
    # 현재 작업 디렉터리를 반환하는 함수 [엘릭서]
    File.cwd()
    # JSON 형식의 문자열을 엘릭서 자료구조로 바꾸는 함수 (검색만)
    # {:ok, data} = Jason.decode("{\"key\": \"value\"}") <- 추가 설치를 해야 하는듯??
    # 운영체제의 셸에서 명령어를 실행하는 함수
    # System.cmd("ls", []) <- 왜인진 모르겠지만 안됌
  end
end
