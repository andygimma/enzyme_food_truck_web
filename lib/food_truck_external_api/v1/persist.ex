defmodule FoodTruckAPI.V1.Persist do
  alias FoodTruck.Repo
  use Tesla

  plug Tesla.Middleware.JSON

  def save_data() do
    {:ok, response} = FoodTruckAPI.V1.SanFrancisco.food_trucks()

    changesets =
      Enum.map(response.body, fn truck ->
        FoodTruck.FoodTruck.changeset(%FoodTruck.FoodTruck{}, truck)
      end)

    Repo.transaction(fn ->
      Enum.each(changesets, &Repo.insert_or_update(&1, []))
    end)
  end
end
