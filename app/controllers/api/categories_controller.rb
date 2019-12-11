class Api::CategoriesController < Api::ApiController

  def index
    @entities = Category.all
  end

end

