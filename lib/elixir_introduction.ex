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
    # 함수 정의 시 () 필요 없음음
    greet = fn -> IO.puts "Hello" end
    greet.()
  end
end
