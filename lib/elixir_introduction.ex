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
    # prefix 함수는 호출 시 새로운 함수를 반환하고,
    # 이 함수(호출된)는 호출하면 첫 번째 문자열과 두 번째 문자열을 공백으로 이은 문자열을 반환한다.
    prefix = fn first_string -> fn second_string -> "#{first_string} #{second_string}" end end
    mrs = prefix.("Mrs")
    IO.puts(mrs.("Smith"))
    IO.puts(prefix.("Elixir").("Rocks"))
  end
end
