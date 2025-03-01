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
        list_concat = fn (list1, list2) -> [list1[0], list1[1], list2[0], list2[1]] end

        # sum.(1, 2, 3)
        # => 6
        sum = fn (a, b, c) -> a + b + c end

        # pair_tuple_to_list.({1234, 5678})
        # => [1234, 5678]
        pair_tuple_to_list = fn (tuple1) -> [tuple1[0], tuple1[1]] end
  end
end
