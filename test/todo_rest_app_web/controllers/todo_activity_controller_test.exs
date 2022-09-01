defmodule TodoRestAppWeb.TodoActivityControllerTest do
  use TodoRestAppWeb.ConnCase

  import TodoRestApp.AccountFixtures

  alias TodoRestApp.Account.TodoActivity

  @create_attrs %{
    todo_activity: "some todo_activity"
  }
  @update_attrs %{
    todo_activity: "some updated todo_activity"
  }
  @invalid_attrs %{todo_activity: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all todo_activities", %{conn: conn} do
      conn = get(conn, Routes.todo_activity_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create todo_activity" do
    test "renders todo_activity when data is valid", %{conn: conn} do
      conn = post(conn, Routes.todo_activity_path(conn, :create), todo_activity: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.todo_activity_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "todo_activity" => "some todo_activity"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.todo_activity_path(conn, :create), todo_activity: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update todo_activity" do
    setup [:create_todo_activity]

    test "renders todo_activity when data is valid", %{conn: conn, todo_activity: %TodoActivity{id: id} = todo_activity} do
      conn = put(conn, Routes.todo_activity_path(conn, :update, todo_activity), todo_activity: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.todo_activity_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "todo_activity" => "some updated todo_activity"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, todo_activity: todo_activity} do
      conn = put(conn, Routes.todo_activity_path(conn, :update, todo_activity), todo_activity: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete todo_activity" do
    setup [:create_todo_activity]

    test "deletes chosen todo_activity", %{conn: conn, todo_activity: todo_activity} do
      conn = delete(conn, Routes.todo_activity_path(conn, :delete, todo_activity))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.todo_activity_path(conn, :show, todo_activity))
      end
    end
  end

  defp create_todo_activity(_) do
    todo_activity = todo_activity_fixture()
    %{todo_activity: todo_activity}
  end
end
