defmodule ExMon.Trainer.Create do
  alias ExMon.Trainer
  alias ExMon.Repo

  def call(attrs) do
    attrs
    |> Trainer.build()
    |> create_trainer()
  end

  defp create_trainer({:ok, struct}) do
    Repo.insert struct
  end

  defp create_trainer({:error, _changeset} = error) do
    error
  end
end
