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
    name = "elixir"
    IO.puts(name)     # "elixir"
    cap_name = String.capitalize(name)
    IO.puts(cap_name) # "Elixir"
    # name의 내부 상태를 변경하는 것이 아닌
    # 잘 조립하여 데이터를 변형하고 새로 할당 (효율적인 메모리로 레퍼런스 등 사용)
  end
end
