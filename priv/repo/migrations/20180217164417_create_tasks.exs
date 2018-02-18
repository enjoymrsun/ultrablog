defmodule Ultrablog.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false
      add :description, :text, null: false
      add :work_time, :integer, default: 0
      add :done, :integer, default: 0
      add :assignee_id, references(:users, on_delete: :delete_all), null: false
      add :issuer_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:tasks, [:assignee_id])
    create index(:tasks, [:issuer_id])
  end
end
