defmodule TodoRestApp.Repo.Migrations.CreateTodoActivities do
  use Ecto.Migration

  def change do
    create table(:todo_activities) do
      add :todo_activity, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:todo_activities, [:user_id])
  end
end
