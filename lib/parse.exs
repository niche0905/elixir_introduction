
# 한편 ?c 표기법을 사용해 문자 c의 코드를 얻을 수도 있다
# 이 표기법은 문자 리스트에서 패턴 매칭을 사용해 정보를 추출할 때 유용하다
# 다음 예제는 10진수가 담긴 문자 리스트를 받아 숫자로 파싱한다(부호는 있을 수도 있고 없을 수도 있다)

defmodule Parse do
  def number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
  def number([ ?+ | tail ]), do: _number_digits(tail, 0)
  def number(str), do: _number_digits(str, 0)

  defp _number_digits([], value), do: value
  defp _number_digits([digit | tail], value)
  when digit in '0123456789' do
    _number_digits(tail, value*10 + digit - ?0)
  end
  defp _number_digits([non_digit | _ ], _) do
    raise("Invalid digit '#{[non_digit]}'")
  end
end

Parse.number('123')
# 123
Parse.number('-123')
# -123
Parse.number('+123')
# 123
Parse.number('+9')
# 9
Parse.number('+a')
# (RuntimeError) Invalid digit 'a'
