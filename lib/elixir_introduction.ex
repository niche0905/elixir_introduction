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
    # with 패턴 매칭
    result1 = with [a | _] <- [1, 2, 3], do: a
    IO.puts(result1)  # 1 (2, 3은 _로 버려짐)
    result2 = with [b | _] <- nil, do: b
    IO.puts(result2)  # nil (패턴 매칭에 실패하여 MatchError 대신 매칭에 실패한 우변의 값 리턴)
  end
end
