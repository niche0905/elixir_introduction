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
    {status, count, action} = {:ok, 42, "next"}
    IO.puts(status) # :ok
    IO.puts(count)  # 42
    IO.puts(action) # "next"
  end
end
