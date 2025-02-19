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
    # 날짜와 시간
    t1 = Time.new(12, 34, 56)
    IO.puts(t1) # {:ok, ~T[12:34:56]}

    {:ok, t1} = Time.new(12, 34, 56)
    t2 = ~T[12:34:56.78]

    t1 == t2 # false

    Time.add(t1, 3600)  # ~T[13:34:56.000000]
    Time.add(t1, 3600, :millisecond)  # ~T[12:34:59.600000]
  end
end
