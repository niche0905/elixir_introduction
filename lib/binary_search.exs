defmodule Chop do
  def guess(actual, range) when is_integer(actual) and is_struct(range, Range) do
    start_value..end_value = range
    mid_value = div(start_value + end_value, 2)
    IO.puts("Is It #{mid_value}")
    if actual == mid_value do
      mid_value
    else
      if actual < mid_value do
        guess(actual, start_value..mid_value)
      else
        guess(actual, mid_value..end_value)
      end
    end
  end
end
