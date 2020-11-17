defmodule ExMon.Trainer do
  use Ecto.Schema
  import Ecto.Changeset
  alias ExMon.Trainer

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "trainers" do
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%Trainer{} = trainer, attrs) do
    trainer
    |> cast(attrs, [:name, :password])
    |> validate_required([:name, :password])
    |> validate_length(:password, min: 6)
    |> hash_password()
  end

  def build(attrs) do
    changeset(%Trainer{}, attrs)
    |> apply_action(:insert)
  end

  defp hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    # %{password_hash: password_hash} = Argon2.add_hash password
    # change changeset, password_hash: password_hash

    change(changeset, Argon2.add_hash(password))
  end

  defp hash_password(%Ecto.Changeset{} = changeset) do
    changeset
  end
end
