defmodule VideoCommentator.Repo do
  use Ecto.Repo,
    otp_app: :video_commentator,
    adapter: Ecto.Adapters.Postgres
end
