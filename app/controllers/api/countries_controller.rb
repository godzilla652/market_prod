class Api::CountriesController < Api::ApiController

  def index
    @entities = Country.all
  end

end
