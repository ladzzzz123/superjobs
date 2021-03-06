defmodule Superjobs.Router do
  use Superjobs.Web, :router

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

  scope "/", Superjobs do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/bicos", PortfolioController, :bicos
    get "/estagiariosonline", PortfolioController, :estagiariosonline
    get "/pagueamigo", PortfolioController, :pagueamigo
    get "/dr-sintomas", PortfolioController, :dr_sintomas
  end

  # Other scopes may use custom stacks.
  # scope "/api", Superjobs do
  #   pipe_through :api
  # end
end
