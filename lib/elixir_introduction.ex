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
    # 키워드 리스트
    [name: "Dave", city: "Dallas", likes: "Programming"]
    # ->
    [{:name, "Dave"}, {:city, "Dallas"}, {:likes, "Programming"}]
    # name: "Dave"를 알아서 {:name, "Dave"} 로 바꾸어 준다다
  end
end
