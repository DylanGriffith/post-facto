defmodule PostFacto.RetroTest do
  use ExUnit.Case
  alias PostFacto.Retro
  alias PostFacto.Retro.Item


  test "#add_item" do
    {:ok, pid} = Retro.start_link("The Retro Name")

    result = Retro.add_item(pid, %Item{title: "Everything sucks!"})

    assert result == %Retro{
      name: "The Retro Name",
      items: [%Item{title: "Everything sucks!"}]
    }
  end
end
