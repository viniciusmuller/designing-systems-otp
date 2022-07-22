defmodule Counter do
  def start(initial_count) when is_number(initial_count) do
    spawn(fn -> Counter.Server.run(initial_count) end)
  end

  def state(pid) when is_pid(pid) do
    send(pid, {:state, self()})

    receive do
      {:count, value} -> value
    end
  end

  def tick(pid) when is_pid(pid) do
    send(pid, {:tick, self()})
    :ok
  end
end
