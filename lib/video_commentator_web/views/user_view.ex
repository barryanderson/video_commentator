defmodule VideoCommentatorWeb.UserView do
  use VideoCommentatorWeb, :view

  alias VideoCommentator.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
