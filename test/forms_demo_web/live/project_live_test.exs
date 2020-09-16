defmodule FormsDemoWeb.ProjectLiveTest do
  use FormsDemoWeb.ConnCase

  import Phoenix.LiveViewTest

  alias FormsDemo.Projects

  defp fixture(:project) do
    {:ok, project} = Projects.create_project(%{name: "some name", category_id: 42})
    project
  end

  defp create_project(_) do
    project = fixture(:project)
    %{project: project}
  end

  describe "Index" do
    setup [:create_project]

    test "saves new project", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.project_index_path(conn, :index))

      assert index_live |> element("a", "New Project") |> render_click() =~
               "New Project"

      assert_patch(index_live, Routes.project_index_path(conn, :new))

      {:ok, _, html} =
        index_live
        |> form("#project-form", project: %{category_id: 42})
        |> render_submit(%{name: "some name"})
        |> follow_redirect(conn, Routes.project_index_path(conn, :index))

      assert html =~ "Project created successfully"
      assert html =~ "some name"
    end
  end
end
