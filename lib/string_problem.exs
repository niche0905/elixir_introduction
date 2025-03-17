
# 연습문제

defmodule StringProblem do
  # 작은따옴표 문자열을 받아서, 문자열이 출력 가능한 아스키 문자(공백부터 틸드(~)까지)만으로 이루어졌으면 true를 반환하는 함수를 만들어보아라
  def is_strlist(str) when is_list(str), do: Enum.all?(str, &(32 <= &1 && &1 <= 126))

  # 파라미터로 받은 두 값이 서로 애너그램 관계이면 true를 반환하는 anagram?(word1, word2) 함수를 만들어보아라라
  def anagram?(word1, word2) when  is_list(word1) and is_list(word2) do
    Enum.sort(word1) == Enum.sort(word2)
  end

  # IEx에 다음과 같이 입력해 보아라
  # [ 'cat' | 'dog' ]
  # [~c"cat", 100, 111, 103]
  # 왜 'cat'은 문자열로 출력되고 'dog'은 숫자로 출력되었을까?
  # [ [99, 97, 116] | [100, 111, 103] ] 이므로 head의 값이 값이 아니라 [] 리스트여서 리스트와 원소의 차이로 'cat'만이 출력될 수 있었다

  # 숫자 [+-*/] 숫자 형식의 문자 리스트를 받아 계산한 결과를 반환하는 함수를 만들어보아라
  # 각 숫자는 부호를 포함하지 않는다
  # caculate('123 + 27') # => 150
  # 패스

end
