defmodule ElixirIntroduction do
  def hello do
    # |> 파이프라인 연산자
    # 파이프 연산자는 코드를 명세와 닮은 꼴로 쓸수 있게 해준다는 것이다
    # - 고객 명단을 구한다
    # - 고객들이 주문한 내역을 구한다
    # - 주문 내역에 대한 세금을 계산한다
    # - 세금을 신고한다
    # 라는 명세를 코드로 바꾸면
    DB.find_customers
    |> Orders.for_customers
    |> sales_tax(2018)
    |> prepare_filing
    # 항목 사이에 |>만 넣고 함수로 구현하기만 하면 된다

    # 프로그래밍은 데이터를 변형하는 작업이며
    # |> 연산자는 변형을 명시적으로 하게 해준다
    # 책의 원서에서 언어를 한마디로 소개하는
    # "Functional |> Concurrent |> Pragmatic |> Fun" 의 의미를 이해할 수 있을 것이다
  end
end
