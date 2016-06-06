defmodule PostFacto.RetrosSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def start_retro(name) do
    Supervisor.start_child(__MODULE__, [name])
  end

  def init(:ok) do
    children = [
      worker(PostFacto.Retro, [], restart: :temporary)
    ]

    supervise(children, strategy: :simple_one_for_one, name: __MODULE__)
  end
end
