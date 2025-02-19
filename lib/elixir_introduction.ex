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
    # 맵 접근
    status = %{"AL" => "Alabama", "WI" => "Wisconsin"}
    IO.puts(status["AL"]) # "Alabama"
    IO.puts(status["TX"]) # nil (null)

    responses = %{{:error, :enoent} => :fatal, {:error, :busy} => :retry}
    IO.puts(responses[{:error, :busy}]) # :retry

    colors = %{:red => 0xff0000, :green => 0x00ff00, :blue => 0x0000ff}
    IO.puts(colors[:red]) # 16711680
    IO.puts(colors.green) # 65280 <- 아톰의 경우 .으로 사용할 수도 있다
  end
end
