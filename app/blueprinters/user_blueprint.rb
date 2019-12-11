class UserBlueprint < Blueprinter::Base

  identifier :id

  field :full_name, name: :name

  fields :email, :phone1, :phone2

  view :supervisor do
    fields :coordinates_updated_at
    field :last_address, name: :address
    association :coordinates, blueprint: CoordinatesBlueprint
  end

end
