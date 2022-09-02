defmodule TodoRestApp.Account.TodoActivity do
  use Ecto.Schema
  import Ecto.Changeset
  alias TodoRestApp.Account.User

  schema "todo_activities" do
    field :todo_activity, :string
    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def changeset(todo_activity, attrs) do
    todo_activity
    |> cast(attrs, [:user_id, :todo_activity])
    |> validate_required([:user_id, :todo_activity])
    |> assoc_constraint(:user)
  end
end
