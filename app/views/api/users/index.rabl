unless @entities.count.eql?(0)
  child @entities, :object_root => false, :root => "items" do
    extends "api/users/_user"
  end
else
  node('items'){[{}]}
end

node(:pagination) do
  api_paginate @entities
end