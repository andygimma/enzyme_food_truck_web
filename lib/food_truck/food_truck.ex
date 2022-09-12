defmodule FoodTruck.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_trucks" do
    field :address, :string
    field :applicant, :string
    field :fooditems, :string
    field :latitude, :string
    field :longitude, :string
    field :objectid, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [:applicant, :address, :fooditems, :latitude, :longitude, :objectid, :status])
    |> validate_required([:applicant, :address, :fooditems, :latitude, :longitude, :objectid, :status])
  end
end
