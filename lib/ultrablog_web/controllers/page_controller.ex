defmodule UltrablogWeb.PageController do
  use UltrablogWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
