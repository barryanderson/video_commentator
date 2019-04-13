defmodule VideoCommentator.UserController do
  use VideoCommentatorWeb, :controller

  alias VideoCommentator.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end
end
