defmodule FoodTruckAPI.V1.Persist do
  alias FoodTruck.Repo
  use Tesla

  plug Tesla.Middleware.JSON

  def get_by_nearest() do
    {:ok, result} = Repo.query("
      SELECT applicant, ST_Distance(ST_MakePoint(-122.431297, 37.773972), ST_GeogFromText('POINT(' || latitude || ' ' || longitude || ')')) AS dist
      FROM food_trucks
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
