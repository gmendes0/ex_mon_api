defmodule ExMonWeb.TrainerView do
  use ExMonWeb, :view
  alias ExMon.Trainer

  def render("create.json", %{trainer: %Trainer{ id: id, name: name, inserted_at: inserted_at } = trainer}) do
    # %{
    #   message: "created",
    #   trainer: %{
    #     id: id,
    #     name: name,
    #     inserted_at: inserted_at,
    #   }
    # }

    %{
      message: "created",
      trainer:
        trainer
        |> Map.delete(:__meta__)
        |> Map.delete(:password)
        |> Map.from_struct()
    }
  end
end
