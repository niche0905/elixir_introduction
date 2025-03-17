
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


  def gpt_calculate(charlist) when is_list(charlist) do
    # 작은따옴표 문자열을 일반 문자열로 변환
    [num1, op, num2] = "#{charlist}" |> String.split()

    # 문자열을 숫자로 변환
    num1 = String.to_integer(num1)
    num2 = String.to_integer(num2)

    # 연산자에 따라 계산 수행
    case op do
      "+" -> num1 + num2
      "-" -> num1 - num2
      "*" -> num1 * num2
      "/" -> num1 / num2
      _ -> raise "Invalid operator"
    end
  end
end


# 연습문제
# 큰따옴표 문자열의 리스트를 받아 줄 때마다 각 문자열을 출력하는 함수를 작성해보아라
# 단, 가장 긴 문자열의 폭에 맞추어 가운데 정렬되어야 한다
# UTF 문자를 입력했을 때도 동작하도록 구현
defmodule MyString do
  def center(strings) when is_list(strings) do
      max_length = strings |> Enum.map(&String.length/1) |> Enum.max()

      for str <- strings do
        padding = div(max_length - String.length(str), 2)
        IO.puts(String.duplicate(" ", padding) <> str)
      end
  end
end


# 연습문제
# 문자열 안에 있는 각 문장에 capitalize 연산을 적용하는 함수를 작성해보아라
# 각 문장은 온점(.)과 공백으로 끝난다
# 문자열을 구성하는 각 문자의 대소문자 여부는 무작위다
defmodule SetenceFormatter do
  def capitalize_sentences(text) do
    text
    |> String.split(". ")  # 문장들을 분리
    |> Enum.map(&String.capitalize/1)  # 각 문장의 첫 글자만 대문자로
    |> Enum.join(". ")  # 다시 문장들을 합침
    |> add_period()  # 마지막 문장에 온점 추가
  end

  defp add_period(text) do
    if String.ends_with?(text, ".") do
      text
    else
      text <> "."
    end
  end
end

# 매출 정보가 파일에 담겨 온다
# 파일에는 id, ship_to, net_amount 값이 쉼표로 구분되어 있으며 내용은 다음과 같다
# id,ship_to,net_amount
# 123,:NC,100.00
# 124,:OK,35.50
# 125,:TX,24.00
# 126,:TX,44.80
# 127,:NC,25.00
# 128,:MA,10.00
# 129,:CA,102.00
# 130,:NC,50.00
# 파일을 읽고 파싱해 결과를 아래 orders 처럼 키워드 리스트의 형식으로 파싱하라
# 각 필드는 정확한 타입으로 파싱해야 한다 (정수, 아톰, 실수)

tax_rates = [NC: 0.075, TX: 0.08]
# orders= [
#   [ id: 123, ship_to: :NC, net_amount: 100.00],
#   [ id: 124, ship_to: :OK, net_amount: 35.50],
#   [ id: 125, ship_to: :TX, net_amount: 24.00],
#   [ id: 126, ship_to: :TX, net_amount: 44.80],
#   [ id: 127, ship_to: :NC, net_amount: 25.00],
#   [ id: 128, ship_to: :MA, net_amount: 10.00],
#   [ id: 129, ship_to: :CA, net_amount: 102.00],
#   [ id: 130, ship_to: :NC, net_amount: 50.00]
# ]

for order <- orders do
  tax = Keyword.get(tax_rates, order[:ship_to], 0.0) # 없는 키의 경우 0.0 반환
  total_amount = order[:net_amount] * (1 + tax)
  order ++ [total_amount: total_amount]
end

defmodule SalesParser do
  def parse_file(filename) do
    # 파일 읽기
    {:ok, content} = File.read(filename)

    # 파일 내용을 줄 단위로 분리하고, 첫 번째 줄(헤더)은 건너뜀
    content
    |> String.split("\n", trim: true)
    |> tl()  # 첫 번째 줄을 건너뛰기 위해 tl/1 사용
    |> Enum.map(&parse_row/1)
  end

  defp parse_row(row) do
    [id_str, ship_to_str, net_amount_str] = String.split(row, ",")

    # 파싱 및 타입 변환
    id = String.to_integer(id_str)
    ship_to = String.to_atom(ship_to_str)
    net_amount = String.to_float(net_amount_str)

    # 키워드 리스트로 반환
    [id: id, ship_to: ship_to, net_amount: net_amount]
  end
end
