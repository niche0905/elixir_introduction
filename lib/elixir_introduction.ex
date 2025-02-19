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
    # 맵
    %{key => value, key => value}
    status = %{"AL" => "Alabama", "WI" => "Wisconsin"}
    responses = %{{:error, :enoent} => :fatal, {:error, :busy} => :retry}
    color = %{:red => 0xff0000, :green => 0x00ff00, :blue => 0x0000ff}
    # == %{blue: 255, green:65280, red: 16711680}
    numbers = %{"one" => 1, :two => 2, {1, 1, 1} => 3}
    name = "Jose Valim"
    names = %{String.downcase(name) => name}
    # 키워드 리스트와 다른 점은 맵은 하나의 키를 한번만 사용 가능하다
    # 키워드 리스트의 경우 동일 키를 여러개 가질 수 있다
    # 크기가 커질수록 맵이 효율적이며 패턴 매칭에 사용할 수 있다
  end
end
