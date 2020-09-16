defmodule FormsDemo.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :category_id, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :category_id])
    |> validate_required([:name, :category_id])
  end
end
