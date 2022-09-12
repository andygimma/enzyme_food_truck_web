defmodule FoodTruckAPI.V1.Persist do
  alias FoodTruck.Repo
  use Tesla

  plug Tesla.Middleware.JSON

  def get_by_nearest() do
    Repo.query("
      SELECT applicant, fooditems, address, status, objectid, latitude, longitude, ST_Distance(ST_MakePoint(-122.431297, 37.773972), ST_GeogFromText('POINT(' || longitude || ' ' || latitude || ')')) AS dist
      FROM food_trucks
      WHERE status = 'APPROVED'
      ORDER BY dist LIMIT 10;
    ")
  end

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
