defmodule FoodTruck.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :applicant, :text
      add :address, :string
      add :fooditems, :string
      add :latitude, :string
      add :longitude, :string
      add :objectid, :string
      add :status, :string

      timestamps()
    end
  end
end
