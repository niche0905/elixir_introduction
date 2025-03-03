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
    greeter = fn name -> (fn -> "Hello #{name}" end) end
    dave_greeter = greeter.("Dave")
    dave_greeter.() # "Hello Dave"
  end
end
