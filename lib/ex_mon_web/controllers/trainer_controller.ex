defmodule ExMonWeb.TrainerController do
  use ExMonWeb, :controller

  action_fallback ExMonWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMon.create_trainer()
    |> handle_response(conn)
  end

  def delete(conn, %{"id" => id} = _params) do
    id
    |> ExMon.delete_trainer()
    |> handle_delete_response(conn)
  end

  defp handle_response({:ok, struct}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", trainer: struct)
  end

  defp handle_response({:error, _changeset} = error, _conn), do: error

  defp handle_delete_response({:ok, _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete_response({:error, _msg} = error, _conn), do: error
end
