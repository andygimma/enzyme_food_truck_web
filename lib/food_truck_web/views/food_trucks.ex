defmodule FoodTruckWeb.FoodTrucksView do
  use FoodTruckWeb, :view

  def render("index.json", %{trucks: trucks}) do
    %{
      trucks: Enum.map(trucks, &truck_json/1)
    }
  end

  def truck_json(truck) do
    [applicant, fooditems, address, status, objectid, latitude, longitude, distance] = truck

    %{
      applicant: applicant,
      address: address,
      fooditems: fooditems,
      latitude: latitude,
      longitude: longitude,
      objectid: objectid,
      status: status,
      distance: distance
    }
  end
end
