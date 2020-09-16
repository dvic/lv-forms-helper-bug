defmodule FormsDemo.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :category_id, :integer

      timestamps()
    end

  end
end
