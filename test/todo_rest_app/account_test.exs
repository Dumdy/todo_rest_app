defmodule TodoRestApp.AccountTest do
  use TodoRestApp.DataCase

  alias TodoRestApp.Account

  describe "users" do
    alias TodoRestApp.Account.User

    import TodoRestApp.AccountFixtures

    @invalid_attrs %{email: nil, user_name: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", user_name: "some user_name"}

      assert {:ok, %User{} = user} = Account.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.user_name == "some user_name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", user_name: "some updated user_name"}

      assert {:ok, %User{} = user} = Account.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.user_name == "some updated user_name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end

  describe "todo_activities" do
    alias TodoRestApp.Account.TodoActivity

    import TodoRestApp.AccountFixtures

    @invalid_attrs %{todo_activity: nil}

    test "list_todo_activities/0 returns all todo_activities" do
      todo_activity = todo_activity_fixture()
      assert Account.list_todo_activities() == [todo_activity]
    end

    test "get_todo_activity!/1 returns the todo_activity with given id" do
      todo_activity = todo_activity_fixture()
      assert Account.get_todo_activity!(todo_activity.id) == todo_activity
    end

    test "create_todo_activity/1 with valid data creates a todo_activity" do
      valid_attrs = %{todo_activity: "some todo_activity"}

      assert {:ok, %TodoActivity{} = todo_activity} = Account.create_todo_activity(valid_attrs)
      assert todo_activity.todo_activity == "some todo_activity"
    end

    test "create_todo_activity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_todo_activity(@invalid_attrs)
    end

    test "update_todo_activity/2 with valid data updates the todo_activity" do
      todo_activity = todo_activity_fixture()
      update_attrs = %{todo_activity: "some updated todo_activity"}

      assert {:ok, %TodoActivity{} = todo_activity} = Account.update_todo_activity(todo_activity, update_attrs)
      assert todo_activity.todo_activity == "some updated todo_activity"
    end

    test "update_todo_activity/2 with invalid data returns error changeset" do
      todo_activity = todo_activity_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_todo_activity(todo_activity, @invalid_attrs)
      assert todo_activity == Account.get_todo_activity!(todo_activity.id)
    end

    test "delete_todo_activity/1 deletes the todo_activity" do
      todo_activity = todo_activity_fixture()
      assert {:ok, %TodoActivity{}} = Account.delete_todo_activity(todo_activity)
      assert_raise Ecto.NoResultsError, fn -> Account.get_todo_activity!(todo_activity.id) end
    end

    test "change_todo_activity/1 returns a todo_activity changeset" do
      todo_activity = todo_activity_fixture()
      assert %Ecto.Changeset{} = Account.change_todo_activity(todo_activity)
    end
  end
end
