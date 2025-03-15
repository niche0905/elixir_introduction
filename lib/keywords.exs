
defmodule Canvas do
  alias Hex.API.Key

  @defaults [ fg: "black", bg: "white", font: "Merriweather"]

  def draw_text(text, options \\ []) do
    options = Keyword.merge(@defaults, options)
    IO.puts("Drawing test #{inspect(text)}")
    IO.puts("Foreground:  #{options[:fg]}")
    IO.puts("Background:  #{Keyword.get(options, :bg)}")
    IO.puts("Font:        #{Keyword.get(options, :font)}")
    IO.puts("Pattern:     #{Keyword.get(options, :patter, "solid")}")
    IO.puts("Style:       #{inspect(Keyword.get_values(options, :style))}")
  end

end

# 키워드 리스트는 일반적으로 함수에 옵션을 전달할 때 사용한다
# 접근 연산자 []를 통해 값에 쉽게 접근할 수 있다
# Keyword와 Enum 모듈의 모든 함수를 사용할 수 있다

Canvas.draw_text("hello", fg: "red", style: "italic", style: "bold")
