defmodule UltrablogWeb.TaskController do
  use UltrablogWeb, :controller

  alias Ultrablog.Accounts
  alias Ultrablog.Social
  alias Ultrablog.Social.Task

  def index(conn, _params) do
    tasks = Social.list_tasks()
    render(conn, "index.html", tasks: tasks, type: 0)
  end

  def main(conn, _params) do
    render conn, "main.html"
  end

  def my_tasks(conn, _params) do
    tasks = Social.get_my_tasks(conn.assigns[:current_user])
    render(conn, "index.html", tasks: tasks, type: 1)
  end

  def my_send_out_tasks(conn, _params) do
    tasks = Social.get_my_send_out_tasks(conn.assigns[:current_user])
    render(conn, "index.html", tasks: tasks, type: 2)
  end

  def new(conn, _params) do
    changeset = Social.change_task(%Task{})
    users = Accounts.list_users()
    render(conn, "new.html", changeset: changeset, users: users)
  end

  def create(conn, %{"task" => task_params}) do
    %{"id": id} = conn.assigns[:current_user]
    %{"assignee_id" => aid, "description" => des, "title" => t} = task_params
    task_params = %{title: t, description: des, assignee_id: aid, issuer_id: id}
    case Social.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: task_path(conn, :show, task))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Social.get_task!(id)
    render(conn, "show.html", task: task)
  end

  def edit(conn, %{"id" => id}) do
    task = Social.get_task!(id)
    changeset = Social.change_task(task)
    users = Accounts.list_users()
    render(conn, "edit.html", task: task, changeset: changeset, users: users)
  end

  def solve(conn, %{"id" => id}) do
    task = Social.get_task!(id)
    changeset = Social.change_task(task)
    time_list = [0, 15, 30, 45, 60, 75, 90, 105, 120]
    render(conn, "solve.html", task: task, changeset: changeset, tlist: time_list)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Social.get_task!(id)
    case Social.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:success, "Task updated successfully.")
        |> redirect(to: task_path(conn, :show, task))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "solve.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Social.get_task!(id)
    {:ok, _task} = Social.delete_task(task)

    conn
    |> put_flash(:success, "Task deleted successfully.")
    |> redirect(to: task_path(conn, :index))
  end
end
