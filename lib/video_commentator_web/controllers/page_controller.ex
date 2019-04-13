defmodule VideoCommentatorWeb.PageController do
  use VideoCommentatorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
