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
        # list_concat.([:a, :b], [:c, :d])
        # => [:a, :b, :c, :d]
        list_concat = fn (list1, list2) -> list1 ++ list2 end   # 더 효율적인 방법

        # sum.(1, 2, 3)
        # => 6
        sum = fn (a, b, c) -> a + b + c end

        # pair_tuple_to_list.({1234, 5678})
        # => [1234, 5678]
        pair_tuple_to_list = fn {a, b} -> [a, b] end    # 더 엘릭서스러운 방식
  end
end
