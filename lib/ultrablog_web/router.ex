defmodule UltrablogWeb.Router do
  use UltrablogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Ultrablog.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UltrablogWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/users", UserController
    resources "/tasks", TaskController
    get "/main", TaskController, :main
    get "/main/my_tasks", TaskController, :my_tasks
    get "/main/my_send_out_tasks", TaskController, :my_send_out_tasks
    get "/tasks/:id/solve", TaskController, :solve

    post "/session", SessionController, :create
    delete "/session", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", UltrablogWeb do
  #   pipe_through :api
  # end
end
