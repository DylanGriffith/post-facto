defmodule PostFacto.RetrosController do
  use PostFacto.Web, :controller

  def create(conn, params) do
    name = params["name"]
    PostFacto.RetrosSupervisor.start_retro(name)
    conn
    |> put_status(201)
    |> json(%{data: %{name: name}})
  end
end
