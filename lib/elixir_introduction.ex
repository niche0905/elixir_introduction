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
        # 함수 인자의 패턴 매칭
        handle_open = fn
                {:ok, file} -> "Read data: #{IO.read(file, :line)}"
                {_, error} -> "Error: #{:file.format_error(error)}"
        end
  end
end
