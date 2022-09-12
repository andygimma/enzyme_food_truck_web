defmodule FoodTruck.Repo.Migrations.ChangeFooditemsToText do
  use Ecto.Migration

  def change do
    alter table("food_trucks") do
      modify :fooditems, :text
    end
  end
end
