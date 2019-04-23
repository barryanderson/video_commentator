defmodule VideoCommentatorWeb.VideoViewTest do
  use VideoCommentatorWeb.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [
      %VideoCommentator.Multimedia.Video{id: "1", title: "dogs"},
      %VideoCommentator.Multimedia.Video{id: "2", title: "cats"}
    ]

    content =
      render_to_string(VideoCommentatorWeb.VideoView, "index.html", conn: conn, videos: videos)

    assert String.contains?(content, "Listing Videos")

    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    owner = %VideoCommentator.Accounts.User{}

    changeset =
      VideoCommentator.Multimedia.change_video(owner, %VideoCommentator.Multimedia.Video{})

    categories = [%VideoCommentator.Multimedia.Category{id: 123, name: "cats"}]

    content =
      render_to_string(VideoCommentatorWeb.VideoView, "new.html",
        conn: conn,
        changeset: changeset,
        categories: categories
      )

    assert String.contains?(content, "New Video")
  end
end
