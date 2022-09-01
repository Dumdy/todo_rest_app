defmodule TodoRestAppWeb.TodoActivityController do
  use TodoRestAppWeb, :controller

  alias TodoRestApp.Account
  alias TodoRestApp.Account.TodoActivity

  action_fallback TodoRestAppWeb.FallbackController

  def index(conn, _params) do
    todo_activities = Account.list_todo_activities()
    render(conn, "index.json", todo_activities: todo_activities)
  end

  def create(conn, %{"todo_activity" => todo_activity_params}) do
    with {:ok, %TodoActivity{} = todo_activity} <- Account.create_todo_activity(todo_activity_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.todo_activity_path(conn, :show, todo_activity))
      |> render("show.json", todo_activity: todo_activity)
    end
  end

  def show(conn, %{"id" => id}) do
    todo_activity = Account.get_todo_activity!(id)
    render(conn, "show.json", todo_activity: todo_activity)
  end

  def update(conn, %{"id" => id, "todo_activity" => todo_activity_params}) do
    todo_activity = Account.get_todo_activity!(id)

    with {:ok, %TodoActivity{} = todo_activity} <- Account.update_todo_activity(todo_activity, todo_activity_params) do
      render(conn, "show.json", todo_activity: todo_activity)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo_activity = Account.get_todo_activity!(id)

    with {:ok, %TodoActivity{}} <- Account.delete_todo_activity(todo_activity) do
      send_resp(conn, :no_content, "")
    end
  end
end
