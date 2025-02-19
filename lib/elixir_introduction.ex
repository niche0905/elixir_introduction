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
    # 바이너리
    bin = <<1, 2>>
    IO.puts(byte_size(bin))  # 2

    bin2 = <<3 :: size(2), 5 :: size(4), 1 :: size(2)>>
    IO.puts(bin2) # 11010101
    IO.puts(byte_size(bin2))  # 1
  end
end
