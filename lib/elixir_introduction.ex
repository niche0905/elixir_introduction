defmodule ElixirIntroduction do
  def hello do
    # |> 파이프라인 연산자
    filing = DB.find_customers
             |> Orders.for_customers
             |> sales_tax(2018)
             |> prepare_filing
    # |> 연산자는 왼쪽 표현식의 결과를 받아서 오른쪽에 있는 함수의 첫 번째 파라미터에 넣는다
    # 첫 번째 함수 호출이 반환한 고객 리스트가 두 번째 함수인 for_customes의 인자가 된다
    # 이 함수가 반환하는 주문 리스트는 sales_tax의 첫 번째 인자가 되며, 2018은 두 번째 인자가 된다
    # 기본적으로 val \> f(a, b)는 f(val, a, b,)와 같다
  end
end
