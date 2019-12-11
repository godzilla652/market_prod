object @entity => nil
attributes :id, :latitude, :longitude, :city, :street, :country_id
node(:country){|place| place.country.name}