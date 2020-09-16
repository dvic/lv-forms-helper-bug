defmodule FormsDemo.Repo do
  use Ecto.Repo,
    otp_app: :forms_demo,
    adapter: Ecto.Adapters.Postgres
end
