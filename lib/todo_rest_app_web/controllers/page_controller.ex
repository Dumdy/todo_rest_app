defmodule TodoRestAppWeb.PageController do
  use TodoRestAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
