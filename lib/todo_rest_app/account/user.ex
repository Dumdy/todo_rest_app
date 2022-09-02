defmodule TodoRestApp.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias TodoRestApp.Account.TodoActivity

  schema "users" do
    field :email, :string
    field :user_name, :string
    has_many(:todo_activity, TodoActivity)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user_name, :email])
    |> validate_required([:user_name, :email])
  end
end
