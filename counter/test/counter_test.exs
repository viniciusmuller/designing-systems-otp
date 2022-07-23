defmodule CounterTest do
  use ExUnit.Case

  test "increases numbers" do
    assert Counter.Core.inc(1) == 2
  end
end
