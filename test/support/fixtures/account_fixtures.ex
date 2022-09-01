defmodule TodoRestApp.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoRestApp.Account` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        user_name: "some user_name"
      })
      |> TodoRestApp.Account.create_user()

    user
  end

  @doc """
  Generate a todo_activity.
  """
  def todo_activity_fixture(attrs \\ %{}) do
    user = user_fixture()

    {:ok, todo_activity} =
      attrs
      |> Enum.into(%{
        todo_activity: "some todo_activity",
        user_id: user.id
      })
      |> TodoRestApp.Account.create_todo_activity()

    todo_activity
  end
end
