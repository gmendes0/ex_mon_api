defmodule ExMon.Repo.Migrations.RenamePasswordColumn do
  use Ecto.Migration

  def change do
    rename table("trainers"), :password, to: :password_hash
  end
end
