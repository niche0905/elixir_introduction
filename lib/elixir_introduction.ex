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
    # Do 블록 스코프
    line_no = 50
    # ...
    if (line_no == 50) do
      IO.puts("new-page\f")
      # 블럭 안에서만 유효한 것
      line_no = 0
    end

    IO.puts(line_no)
  end
end
