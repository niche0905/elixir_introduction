defmodule Chop do
  def guess(actual, range) when is_integer(actual) and is_struct(range, Range) do
    start_value..end_value//_ = range
    guess_helper(actual, div(start_value + end_value, 2), start_value, end_value)
  end

  defp guess_helper(actual, mid, _low, _high) when actual == mid do
    IO.puts("Is It #{mid}")
    mid
  end

  defp guess_helper(actual, mid, low, _high) when actual < mid do
    IO.puts("Is It #{mid}")
    guess_helper(actual, div(low + mid - 1, 2), low, mid - 1)
  end

  defp guess_helper(actual, mid, _low, high) when actual > mid do
    IO.puts("Is It #{mid}")
    guess_helper(actual, div(mid + 1 + high, 2), mid + 1, high)
  end
end
