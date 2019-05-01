defmodule VideoCommentatorWeb.PageControllerTest do
  use VideoCommentatorWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Video Commentator"
  end
end
