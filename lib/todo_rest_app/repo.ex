defmodule TodoRestApp.Repo do
  use Ecto.Repo,
    otp_app: :todo_rest_app,
    adapter: Ecto.Adapters.Postgres
end
