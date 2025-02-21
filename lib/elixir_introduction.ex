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
    # with 사용 시 주의사항
    mean = with # 이렇게 사용하면 안된다
            count = Enum.count(values),
            sum   = Enum.sum(values)
           do
            sum / count
           end

    # 이렇게 사용해야 한다다
    mean = with count = Enum.count(values), # 첫 번째 파라미터를 with와 같은 줄에
            sum   = Enum.sum(values)
           do
            sum / count
           end

    # 괄호를 사용해도 좋다
    mean = with(
            count = Enum.count(values), # 첫 번째 파라미터를 with와 같은 줄에
            sum   = Enum.sum(values)
           ) do
            sum / count
           end

    # do를 단축 문법으로 사용하는 방법이다
    mean = with count = Enum.count(values),
            sum   = Enum.sum(values)
           do: sum / count
  end
end
