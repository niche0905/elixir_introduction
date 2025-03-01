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
    fun1 = fn -> fn -> "Hello" end end
    fun1.()     # #Function
    fun1.().()  # "Hello"
  end
end
