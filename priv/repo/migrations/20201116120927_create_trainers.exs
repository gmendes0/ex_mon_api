defmodule ExMon.Repo.Migrations.CreateTrainers do
  use Ecto.Migration

  def change do
    create table(:trainers, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :password, :string

      timestamps()
    end

  end
end
