
# 문자열 리터럴
# 엘릭서에는 두 종류에 문자열이 있다
# 하나는 작은따옴표(single quotation)로 감싼 것이고 다른 하나는 큰따옴표(double quotation)로 감싼 것이다
# 둘은 내부 구현이 매우 다르지만 공통점도 많다
# 양쪽 모두 다음과 같은 특징이 있다
# - UTF-8 인코딩된 문자를 저장할 수 있다
# - 이스케이프 문자를 포함할 수 있다
# - #{...} 문법으로 엘릭서 표현식을 삽입할 수 있다
# - 특별한 의미를 가진 문자는 백슬래시(\)를 사용해 이스케이프할 수 있다 (ex \' 등)
# 히어독스 표기법을 지원한다

# 히어독스
# 모든 문자열은 여러 줄로 늘어날 수 있다
# 문자열을 출력할 때는 IO.puts와 IO.write라는 두 함수를 사용할 수 있는데,
# puts는 항상 줄바꿈을 추가한다 (python의 default print 같네)
# 이 절에서 여러 줄인 문자열을 출력할 때는 줄바꿈을 추가하지 않는 write 함수를 사용한다

IO.puts("start")
IO.write("
  my
  string
")
IO.puts("end")
# 위 코드가 실행되면 아래와 같이 출력 된다
# start
#
#   my
#   string
# end

# 여러 줄 문자열의 앞뒤 줄바꿈, 중간에 위치한 줄의 들여쓰기가 그대로 유지되었다
# 히어독스 표기법은 이러한 문제를 해결해준다
# 다음처럼 문자열 구분자를 세 번 입력하고(''', """ 똑같은듯)
# 내용의 들여쓰기에 맞추어서 닫는 구분자를 넣어주면 된다

IO.puts("start")
IO.write("""
  my
  string
  """)  # <= 닫는 """가 들여쓰기를 정함
IO.puts("end")

# 위 코드가 실행되면 다음과 같이 출력 된다
# start
# my
# string
# end

# 히어독스는 함수나 모듈의 문서를 추가할 때 많이 사용한다


# 시길
# 루비와 비슷하게, 엘릭서는 일부 리터럴에 대한 대체 문법을 제공한다
# 그중 하나로 ~r{...}로 정규식을 생성할 수 있다
# 이와 같이 ~로 시작하는 리터럴을 엘릭서에서는 시길이라 부른다
# 시길은 틸드(~)로 시작하며 영문 대문자나 소문자 중 한 글자, 구분자로 싸인 내용, 부가적인 옵션이 차례로 이어진다
# 구분자는 <...>, {...}, [...], (...), |...|, /.../, "...", '...' 등이 될 수 있다
# 틸드 뒤에 오는 문자는 시길의 종류를 정한다
# ~C : 이스케이프 또는 문자열 삽입을 수행하지 않는 문자 리스트
# ~c : 이스케이프 밎 문자열 삽입을 수행하는 문자 리스트로, 작은따옴표(') 문자열과 같음 # <= 요즘은 시길 문법으로 쓰길 원하는듯?
# ~D : yyyy-mm-dd 형식의 날짜로, 타입은 Data
# ~N : yyyy-mm-dd:mm:ss[.ddd] 형식의 NaiveDateTime
# ~R : 이스케이프 또는 문자열 삽입을 수행하지 않는 정규식
# ~r : 이스케이프 및 문자열 삽입을 수행하는 정규식
# ~S : 이스케이프 또는 문자열 삽입을 수행하지 않는 문자열
# ~s : 이스케이프 및 문자열 삽입을 수행하는 문자열로, 큰따옴표(") 문자열과 같음
# ~T : hh:mm:ss[.dddd] 형식의 시간으로, 타입은 타임
# ~U : ISO-8601 형식의 날짜로, 타입은 DateTime
# ~W : 공백 문자로 값을 구분하는 리스트로, 이스케이프 또는 문자열 삽입을 수행하지 않음
# ~w : 공백 문자로 값을 구분하는 리스트로, 이스케이프 및 문자열 삽입을 수행함

# 다음은 다양한 구분자를 사용한 시길의 예시다
~C[1\n2#{1+2}]
# ~c"1\\n2\#{1+2}"
~c"1\n2#{1+2}"
# ~c"1\n23"
~S[1\n2#{1+2}]
# "1\\n2\#{1+2}"
~s/1\n2#{1+2}/
# "1\n23"
~W[the c#{'a'}t sat on the mat]
# ["the", "c\#{'a'}t", "sat", "on", "the", "mat"]
~w[the c#{'a'}t sat on the mat]
# ["the", "cat", "sat", "on", "the", "mat"]
~D<1999-12-31>
# ~D[1999-12-31]
~T[12:34:56]
# ~T[12:34:56]
~N{1999-12-31 23:59:50}
# ~N[1999-12-31 23:59:50]

# ~W와 ~w 시길은 옵션으로 a, c, s를 받는다
# 이 옵션은 값을 아톰, 문자 리스트, 문자열 중 무엇으로 반환할지를 결정한다

~w[the c#{'a'}t sat on the mat]a
# [:the, :cat, :sat, :on, :the, :mat]
~w[the c#{'a'}t sat on the mat]c
# [~c"the", ~c"cat", ~c"sat", ~c"on", ~c"the", ~c"mat"]
~w[the c#{'a'}t sat on the mat]s
# ["the", "cat", "sat", "on", "the", "mat"]

# 내용을 감싸는 구분자는 '단어가 아닌' 문자라면 무엇이든 괜찮다
# 괄호 종류 (, [, {, <로 시작했다면 그에 대응하는 닫힘 문자를 종료 구분자로 사용해야 한다
# 구분자가 괄호가 아니라면 이스케이프되지 않은 상태로 두 번째로 나오는 시작 시분자가 종료 구분자가 왼다
# 엘릭서는 구분자의 중첩을 확인하지 않는다
# 따라서 ~{a{b}와 같은 시길은 a{b라는 세 글자 짜리 문자열이 된다
# 만약 시작 구분자가 작은따옴표나 근따옵표 세 개변, 이 시길은 히어독스로 취급된다

~w"""
the
cat
sat
"""
# ["the", "cat", "sat"]

# 히어독스 시길에 옵션을 넣고 싶을 때도(대부분 ~r을 사용할 때) 마찬가지로 종료 구분자 뒤에 넣어주면 된다
~r"""
hello
"""i
# ~r/hello\n/i

# 이 시길을 직접 만들 수도 있다


# 문자열과 문자 리스트
# 엘릭서에서는 관습적으로 큰따옴표 문자열만을 '문자열'이라 부른다
# 작은따옴표를 사용한경우는 '문자 리스트'라고 한다
# 이는 상당히 중요하다
# 이 둘은 매우 다르며, 문자열을 받는 라이브러리는 큰따옴표 문자열에 대해서만 동작한다
# 두 형식이 어떻게 다른지 조금 더 자세히 살펴보자

# 문자 리스트
# 작은따옴표 문자열은 내부적으로는 정수의 리스트로 표현되는데, 이때 각 정수값은 문자열의 유니코드 코드포인트다
# 작은따옴표 문자열을 문자 리스트를 문자 리스트라고 부르는 이유가 바로 이 때문이다

str = 'wombat'
# ~c"wombat"
is_list(str)
# true
length(str)
# 6
Enum.reverse(str)
# ~c"tabmow"

# 정수 리스트를 이루는 값이 모두 출력 가능한 문자의 코드포인트일 때 IEx가 리스르르 문자열로 출력한다
# 리스트를 만들어서 직접 확인해보자
[67, 65, 84]
# ~c"CAT"

# 다양한 방법으로 문자 리스트의 내부 표현을 확인할 수 있다
str = 'wombat'
# ~c"wombat"
:io.format("~w~n", [str])
# [119,111,109,98,97,116]
# :ok
List.to_tuple(str)
# {119, 111, 109, 98, 97, 116}
str ++ [0]
# [119, 111, 109, 98, 97, 116, 0]

# ~w 포맷 문자열은 str이 얼랭 표준 문법에 따른 값(위 경우 정수 리스트)으로 출력되도록 강제한다
# ~n은 줄바꿈을 의미한다
# 마지막 줄에서는 널바이트를 리스트 끊에 넣어 새로운 문자 리스트를 만들었다
# 이제 리스트에 있는 값이 모두 출력 가능하다고 간주할 수 없게 되었으므로 문자가 아닌 정수 코드포인터가 그대로 표시되었다 (\0를 문자로 보지 않는듯함)

# 이와 같이 문자 리스트가 출력 가능하지 않다고 판단되는 값을 포함하는 경우 문자열 대신 리스트를 보게 된다
'∂x/∂y'
# [8706, 120, 47, 8706, 121]

# 문자 리스트 역시 리스트이므로 패턴 매칭과 List 모듈의 함수를 사용할 수 있다
'pole' ++ 'vault'
# ~c"polevault"
'pole' -- 'vault'
# ~c"poe"
List.zip(['abc', '123'])
# [{97, 49}, {98, 50}, {99, 51}]
[head | tail] = 'cat'
# ~c"cat"
head
# 99
tail
# ~c"at"
[head | tail]
# ~c"cat"

# 'cat의 head 값이 왜 c가 아니고 99인지는 head에는 99라는 정수가 들어가 있기 때문에 ([99]가 아닌 99이다) 99가 출력된다


# 문자열
# 큰따옴표 문자열은 바이너리다
# 작은따옴표 문자열은 문자의 리스트로 저장되지만, 큰 따옴표 문자열은 연속된 바이트에 UTF-8 인코딩되어 저장된다
# 이 방식은 메모리나 데이터 접근의 관점에서 분명 더 효율적이나, 겉으로 드러나지 않는 두 가지 의미를 더 지닌다
# 먼저, UTF-8 문자는 한글자가 여러 바이트를 사용할 수 있기 때문에 바이너리의 크기와 문자열의 길이가 반드시 일치하지는 않는다
dqs = "∂x/∂y"
# "∂x/∂y"
String.length(dqs)
# 5
byte_size(dqs)
# 9
String.at(dqs, 0)
# "∂"
String.codepoints(dqs)
# ["∂", "x", "/", "∂", "y"]
String.split(dqs, "/")
# ["∂x", "∂y"]

# 문자열을 표현할 떄 더 이상 문자 리스트가 아니므로 바이너리 문법도 함께 익혀하 한다

# String 라이브러리
# 엘릭서 라이브러리 문서에서 문자열 또는 바이너리라는 용어는 항상 큰따옴표 문자열을 의미한다
# String 모듈에는 큰따옴표 문자열에 대해 사용할 수 있는 함수가 정의되어 있다

# at(str, offset)
# 0부터 시작해서 offset 번쨰 위치에 있는 자소를 반환한다
# offset이 음수일 때는 문자열의 끝부터 센다(파이썬 같다)
String.at("∂og", 0)
# "∂"
String.at("∂og", -1)
# "g"

# capitalize(str)
# 문자열을 모두 소문자로 바뀐 뒤 첫번째 문자를 대문자로 바꾼다
String.capitalize("ecole")
# "Ecole"
String.capitalize("iiiii")
# "Iiiii"

# codepoints(str)
# 문자열의 코드포인트 리스트를 반환한다
String.codepoints("Jose's ∂og")
["J", "o", "s", "e", "'", "s", " ", "∂", "o", "g"]

# downcase(str)
# 문자열의 모든 문자를 소문자로 바꾼다
String.downcase("ORSteD")
# "orsted"

# duplicate(str, n)
# 문자열을 n번 복사해 반환한다
String.duplicate("Ho! ", 3)
# "Ho! Ho! Ho! "

# ends_with?(str, suffix | [suffixes])
# 문자열이 .suffix 또는 suffixes 중 하나로 끝나면 true를 반환한다
String.ends_with?("string", ["elix", "stri", "ring"])
# true

# first(str)
# 문자열의 첫 번째 자소를 반환한다
String.first("∂og")
# "∂"

# graphemes(str)
# 문자열의 자소 리스트를 반환한다
# codepoints 함수와 비슷하지만 결합 문자 처리 방법이 다르다
# codepoints 함수는 결합 문자를 구성하는 각 문자를 모두 나누어 반환한다
String.codepoints("noe\u0308l")
# ["n", "o", "e", "̈", "l"]
String.graphemes("noe\u0308l")
# ["n", "o", "ë", "l"]

# jaro_distance(str1, str2)
# 두 문자열의 유사도를 나타내는 0과 1 사이의 실수를 반환한다
String.jaro_distance("jonathan", "jonathon")
# 0.9166666666666666

# last(str)
# 문자열의 마지막 자소를 반환한다
String.last("∂og")
# "g"

# length(str)
# 문자열의 자소 개수를 반환한다
String.length("∂x/∂y")
# 5

# myers_difference(str1, str2)
# 문자열 하나를 다른 하나로 변환하려면 어떻게 바꾸어야 하는지를 리스트로 반환한다
String.myers_difference("banana", "panama")
# [del: "b", ins: "p", eq: "ana", del: "n", ins: "m", eq: "a"]

# next_codepoints(str)
# 문자열을 분리해 첫 번쨰 코드포인트와 나머지 문자열을 반환한다
# 문자열이 비어 있으면 nil이 반환된다
# 이 함수는 이터레이터를 구성하는 데 사용된다
defmodule MyString do
  def each(str, func), do: _each(String.next_codepoint(str), func)

  defp _each({codepoint, rest}, func) do
    func.(codepoint)
    _each(String.next_codepoint(rest), func)
  end

  defp _each(nil, _), do: []
end

MyString.each("∂og", fn c -> IO.puts(c) end)
# ∂
# o
# g

# next_grapheme(str)
# next_codepoint 함수와 마찬가지로 동작하지만 자소를 반환한다 (문자열의 끝에 도착하면 :no_grapheme를 반환한다)

# pad_leading(str, new_length, padding \\ "")
# 최소 길이 new_length의 새로운 문자열을 반환한다
# str로 들어온 문자열이 오른쪽 정렬되고 padding 이 나머지 부분을 채운다
String.pad_leading("cat", 5, ">")
# ">>cat"

# pad_trailing(str, new_length, padding \\ "")
# 최소 길이 new_length의 새로운 문자열을 반환한다
# str로 들어온 문자열이 왼쪽 정렬되고 padding 이 나머지 부분을 채운다
String.pad_trailing("cat", 5)
# "cat  "

# printable?(str)
# 문자열이 출력 가능한 문자만으로 이루어져 있으면 true를 반환한다
String.printable?("Jose")
# true
String.printable?("\x00 a null")
# false

# replace(str, pattern, replacement, options \\ [global: true, insert_replaced: nil])
# reverse(str)
# slice(str,offset, len)
# split(str, pattern \\ nil, options \\ [global: true])
# starts_with?(str, prefix | [prefixes])
# trim(str)
# trim(str, character)
# trim_leading(str)
# trim_leading(str, character)
# trim_trailing(str)
# trim_trailing(str, character)
# upcase(str)
# valid?(str)

# 이 외에도 더 다양한 API가 있다


# 정리
# 엘릭서에서 문자열을 처리하는 것은 얼랭 환경이 오랫동안 진화해혼 겨로가를 이어 받았기 때문이다
# 언어를 바닥부터 만들었다면 다른 형태가 되었을 수도 있다
# 하지만 바이너리를 사용해 매치앟는 조금 이상한 방식을 극복하고 나면 이 방식이 꽤 괜찮음을 알게 될 것이다
# 특히 패턴 매칭을 사용하면 특정 문자 배열로 시작하는 문자열을 찾기가 매우 쉬우므로 간단한 파싱 작업을 하기가 훨씬 편해진다
