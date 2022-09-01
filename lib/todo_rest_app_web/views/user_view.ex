defmodule TodoRestAppWeb.UserView do
  use TodoRestAppWeb, :view
  alias TodoRestAppWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      user_name: user.user_name,
      email: user.email
    }
  end
end
