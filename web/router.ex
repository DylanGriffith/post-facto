defmodule PostFacto.Router do
  use PostFacto.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PostFacto do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end


  scope "/api", PostFacto do
    pipe_through :api
    scope "/retros" do
      post "/", RetrosController, :create
    end
  end
end
