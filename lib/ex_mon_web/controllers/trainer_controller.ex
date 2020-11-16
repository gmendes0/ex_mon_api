defmodule ExMonWeb.TrainerController do
  use ExMonWeb, :controller

  def create(conn, params) do
    params
    |> ExMon.create_trainer()
    |> handle_response(conn)
  end

  defp handle_response({:ok, struct}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", trainer: struct)
  end
end
