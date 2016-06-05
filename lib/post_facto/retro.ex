defmodule PostFacto.Retro do
  defmodule Item do
    defstruct title: nil
  end

  alias PostFacto.Retro.Item

  defstruct name: nil, items: []

  # API
  def start_link(name) do
    GenServer.start_link(__MODULE__, name, [])
  end

  def add_item(pid, item = %PostFacto.Retro.Item{}) do
    GenServer.call(pid, {:add_item, item})
  end

  # GenServer implementation
  def init(name) do
    state = %PostFacto.Retro{name: name}
    {:ok, state}
  end

  def handle_call({:add_item, item}, _from, state) do
    items = [item | state.items]
    state = %{state | items: items}
    {:reply, state, state}
  end
end
