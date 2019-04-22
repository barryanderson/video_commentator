# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     VideoCommentator.Repo.insert!(%VideoCommentator.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias VideoCommentator.Multimedia

for category <- ~w(Technology News Sci-Fi Comedy Music Programming) do
  Multimedia.create_category(category)
end
