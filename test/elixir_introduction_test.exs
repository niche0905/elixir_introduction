defmodule ElixirIntroductionTest do
  use ExUnit.Case
  doctest ElixirIntroduction

  test "greets the world" do
    assert ElixirIntroduction.hello() == :world
  end
end
