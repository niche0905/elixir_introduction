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
    # 다음 코드를 & 표기법을 사용하도록 고쳐보라

    Enum.map([1, 2, 3, 4], fn x -> x + 2 end)
    # =>
    Enum.map([1, 2, 3, 4], &(&1 + 2))

    Enum.each([1, 2, 3, 4], fn x -> IO.inspect(x) end)
    # =>
    Enum.each([1, 2, 3, 4], &IO.inspect/1)

  end
end
