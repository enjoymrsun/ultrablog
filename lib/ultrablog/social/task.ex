defmodule Ultrablog.Social.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ultrablog.Social.Task


  schema "tasks" do
    field :description, :string
    field :done, :integer
    field :title, :string
    field :work_time, :integer
    belongs_to :assignee, Ultrablog.Accounts.User, foreign_key: :assignee_id
    belongs_to :issuer, Ultrablog.Accounts.User, foreign_key: :issuer_id

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :work_time, :done, :assignee_id, :issuer_id])
    |> validate_required([:title, :description, :assignee_id, :issuer_id])
  end
end
