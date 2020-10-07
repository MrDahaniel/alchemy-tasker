defmodule AlchemyTaskerWeb.PageController do
  use AlchemyTaskerWeb, :controller

  def index(conn, _params) do
    render(conn, "alchemy.html")
  end
end
