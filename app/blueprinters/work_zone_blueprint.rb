class WorkZoneBlueprint < Blueprinter::Base

  identifier :id

  fields :name

  association :center_coordinates, blueprint: CoordinatesBlueprint
  association :paths, blueprint: CoordinatesBlueprint

end
