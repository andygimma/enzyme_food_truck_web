defmodule FoodTruckAPI.V1.SanFrancisco do
  use Tesla

  plug Tesla.Middleware.JSON

  def food_trucks() do
    get("https://data.sfgov.org/resource/rqzj-sfat.json")
  end
end
