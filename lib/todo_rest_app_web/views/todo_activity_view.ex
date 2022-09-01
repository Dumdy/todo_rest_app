defmodule TodoRestAppWeb.TodoActivityView do
  use TodoRestAppWeb, :view
  alias TodoRestAppWeb.TodoActivityView

  def render("index.json", %{todo_activities: todo_activities}) do
    %{data: render_many(todo_activities, TodoActivityView, "todo_activity.json")}
  end

  def render("show.json", %{todo_activity: todo_activity}) do
    %{data: render_one(todo_activity, TodoActivityView, "todo_activity.json")}
  end

  def render("todo_activity.json", %{todo_activity: todo_activity}) do
    %{
      id: todo_activity.id,
      todo_activity: todo_activity.todo_activity
    }
  end
end
