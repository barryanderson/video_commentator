defmodule VideoCommentatorWeb.AnnotationView do
  use VideoCommentatorWeb, :view

  def render("annotation.json", %{annotation: annotation}) do
    %{
      id: annotation.id,
      body: annotation.body,
      at: annotation.at,
      user: render_one(annotation.user, VideoCommentatorWeb.UserView, "user.json")
    }
  end
end
