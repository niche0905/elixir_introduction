
# 2부터 n까지의 소수 리스트를 반환하는 함수를 만들어보자
# 7장의 마지막 연슴문제에서 작성한 span 함수와 리스트 컴프리헨션 문을 사용하자

defmodule MyList do
  def span(from, to) when from > to, do: raise(ArgumentError, message: "Invalid range: from > to")
  def span(to, to), do: [to]
  def span(from, to), do: [from | span(from + 1, to)]
end


prime_list = fn n ->
               for num <- MyList.span(2, n) do
                 pass = for denom <- MyList.span(2, num - 1) do
                   rem(num, denom) == 0
                 end
                 if Enum.all?(pass, false) do
                   num
                 end
               end
             end

# gpt 개선 코드 (문제의 의도가 이것인지는 잘 모르겠음 아마 맞겠지 뭐)
gpt_prime_list = fn n ->
                   for num <- MyList.span(2, n), num == 2 or Enum.all?(MyList.span(2, max(2, trunc(:math.sqrt(num)))), fn denom -> rem(num, denom) != 0 end) do
                     num
                   end
                 end

IO.inspect(gpt_prime_list.(100))

# Pragmatic Booshelf 출반사는 사무실이 텍사스주(TX)와 노스캐롤라잊나주(NC)에 있으며
# 두 주로 배송되는 주문 건에는 소비세가 부가된다
# 소비세율은 키워드 리스트로 주어진다
tax_rates = [NC: 0.075, TX: 0.08]
# 주문 리스트는 다음과 같다
orders= [
  [ id: 123, ship_to: :NC, net_amount: 100.00],
  [ id: 124, ship_to: :OK, net_amount: 35.50],
  [ id: 125, ship_to: :TX, net_amount: 24.00],
  [ id: 126, ship_to: :TX, net_amount: 44.80],
  [ id: 127, ship_to: :NC, net_amount: 25.00],
  [ id: 128, ship_to: :MA, net_amount: 10.00],
  [ id: 129, ship_to: :CA, net_amount: 102.00],
  [ id: 130, ship_to: :NC, net_amount: 50.00]
]

# 두 리스트를 받아 주문 리스트의 복사본을 반환하는 함수를 구현하자
# 반환되는 주문 리스트의 각 항목에는 금액(net_amount)에 소비세를 더한 total_amount 필드를 추가해야 한다
# 두 주 외의 다른 곳으로 배송되는 주문에는 소비세가 부가되지 않는다

for order <- orders do
  ship_to = order[:ship_to]
  if ship_to == :NC || ship_to == :TX do
    order ++ [total_amount: order[:net_amount] + tax_rates[ship_to]]
  else
    order ++ [total_amount: order[:net_amount]]
  end
end

# gpt 개선 사항
for order <- orders do
 tax = Keyword.get(tax_rates, order[:ship_to], 0.0) # 없는 키의 경우 0.0 반환
 total_amount = order[:net_amount] * (1 + tax)
 order ++ [total_amount: total_amount]
end


# 엘릭서에서의 재귀
# "순회하는 것은 인간적이고, 재귀하는 것은 신성하다" - 피터 도이치
# 엘릭서 코드에서 재귀 함수를 패턴 매칭에 사용하는 것을 주로 사용하면 재귀를 지나치게 쓰는건 아닌가 하는 생각에 빠진다
# 언제 재귀를 사용하고 언제 반복을 사용하면 좋은지를 생각하는 과정을 통해 엘릭서를 효과적으로 익히는데 도움이 된다
# 가능한 반복을 사용하기를 추천한다
