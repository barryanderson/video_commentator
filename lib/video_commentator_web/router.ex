defmodule VideoCommentatorWeb.Router do
  use VideoCommentatorWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug VideoCommentatorWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VideoCommentatorWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/watch/:id", WatchController, :show
  end

  scope "/manage", VideoCommentatorWeb do
    pipe_through [:browser, :authenticate_user]
    resources "/videos", VideoController
  end

  # Other scopes may use custom stacks.
  # scope "/api", VideoCommentatorWeb do
  #   pipe_through :api
  # end
end
