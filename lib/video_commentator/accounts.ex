defmodule VideoCommentator.Accounts do
  @moduledoc """
  The accounts context.
  """

  alias VideoCommentator.Accounts.User

  def list_users() do
    [
      %User{id: "0", name: "Barry Anderson", username: "barry"},
      %User{id: "1", name: "Lesley Anne Anderson", username: "lesley"},
      %User{id: "2", name: "Ruby Anderson", username: "ruby"},
      %User{id: "3", name: "Leo Anderson", username: "leo"}
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), fn map -> map.id == id end)
  end

  def get_user_by(params) do
    Enum.find(list_users(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end
end
