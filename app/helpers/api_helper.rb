module ApiHelper
  def api_paginate(collection)
    puts collection.inspect
    {
        :total_items => collection.count, #total_count,
        :total_pages => collection.total_pages,
        :current_page => collection.current_page,
        :per_page => params[:per_page].nil? ? collection.default_per_page : params[:per_page].to_i
    }
  end
end
