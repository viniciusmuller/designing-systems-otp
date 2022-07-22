defmodule Counter.Server do
  alias Counter.Core

  def run(count) when is_number(count) do
    new_count = listen(count)
    run(new_count)
  end

  def listen(count) when is_number(count) do
    receive do
      {:tick, _pid} ->
        Core.inc(count)

      {:state, pid} ->
        send(pid, {:count, count})
        count
    end
  end
end
