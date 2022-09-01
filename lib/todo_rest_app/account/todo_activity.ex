defmodule TodoRestApp.Account.TodoActivity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todo_activities" do
    field :todo_activity, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(todo_activity, attrs) do
    todo_activity
    |> cast(attrs, [:todo_activity])
    |> validate_required([:todo_activity])
  end
end
