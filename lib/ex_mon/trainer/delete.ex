defmodule ExMon.Trainer.Delete do
  alias Ecto.UUID
  alias ExMon.{Repo, Trainer}

  def call(id) do
    case UUID.cast(id) do
      {:ok, uuid} ->
        delete(uuid)

      :error ->
        {:error, "invalid ID"}
    end
  end

  defp delete(uuid) do
    case fetch_trainer(uuid) do
      nil ->
        {:error, "trainer not found"}

      trainer = %Trainer{} ->
        trainer
        |> Repo.delete()

      _ ->
        {:error, "bad fetch"}
    end
  end

  defp fetch_trainer(uuid) do
    Trainer
    |> Repo.get(uuid)
  end
end
