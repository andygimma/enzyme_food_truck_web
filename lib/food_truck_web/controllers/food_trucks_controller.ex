defmodule FoodTruckWeb.FoodTrucksController do
  use FoodTruckWeb, :controller

  alias FoodTruckAPI.V1.Persist

  def index(conn, _params) do
    {:ok, result} = Persist.get_by_nearest()
    render(conn, "index.json", trucks: result.rows)
  end
end
