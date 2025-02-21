defmodule ElixirIntroduction do
  @moduledoc """
  Documentation for `ElixirIntroduction`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirIntroduction.hello()
      :world

  """
  def hello do
    # with 표현식
    lp = with content = "fefefe",  # 임시 변수가 with 스코프 안에서만 볼 수 있게
              IO.puts(content)
         do
              "Name: #{content}"
         end

    IO.puts(lp)
    # IO.puts(content)  # 해당 content를 찾을 수 없을 것임
  end
end
