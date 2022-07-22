defmodule Counter.Core do
  def inc(value) when is_number(value) do
    value + 1
  end
end
