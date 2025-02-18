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
    [a, _, _] = [1, 2, 3]
    IO.puts(a)  # 1
    [b, "cat", _] = ["holse", "cat", "dog"]
    IO.puts(b)  # "hosle"
    # _를 와일드카드로 사용하기
  end
end
