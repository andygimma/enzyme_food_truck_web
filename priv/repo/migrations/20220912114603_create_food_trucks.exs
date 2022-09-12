defmodule FoodTruck.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :applicant, :string
      add :address, :string
      add :fooditems, :text
      add :latitude, :float
      add :longitude, :float
      add :objectid, :string
      add :status, :string

      timestamps()
    end
  end
end
