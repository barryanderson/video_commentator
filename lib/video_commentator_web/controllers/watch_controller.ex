defmodule VideoCommentatorWeb.WatchController do
  use VideoCommentatorWeb, :controller
  alias VideoCommentator.Multimedia

  def show(conn, %{"id" => id}) do
    video = Multimedia.get_video!(id)
    render(conn, "show.html", video: video)
  end
end
