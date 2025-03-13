defmodule ElixirIntroduction do
  def hello do
    # 소수를 소수점 아래 두 자리까지의 문자열로 바꾸는 함수 [얼랭]
    # https://www.erlang.org/docs/23/man/io_lib#format-2
    :io_lib.format("~.2f", [5.12]) # <- 문자열 아님 문자 리스트임
    # 운영체제의 환경 변수를 얻어오는 함수 [엘릭서]
    # https://hexdocs.pm/elixir/1.12/System.html#get_env/0
    System.get_env("HOME")
    # 파일의 확장자를 반환하는 함수 [엘릭서]
    # https://hexdocs.pm/elixir/1.12/Path.html
    Path.extname("file.txt")
    # 현재 작업 디렉터리를 반환하는 함수 [엘릭서]
    # https://hexdocs.pm/elixir/1.12/File.html#cwd/0
    File.cwd()
    # JSON 형식의 문자열을 엘릭서 자료구조로 바꾸는 함수 (검색만)
    # https://hexdocs.pm/jason/Jason.html#decode/2
    # {:ok, data} = Jason.decode("{\"key\": \"value\"}") <- 추가 설치를 해야 하는듯??
    # 운영체제의 셸에서 명령어를 실행하는 함수
    # https://hexdocs.pm/elixir/1.15.8/System.html#cmd/3
    # System.cmd("dir", []) <- 윈도우 환경이라 cmd라 써야함
    # System.cmd("cmd", ["/c", "dir"])
  end
end
