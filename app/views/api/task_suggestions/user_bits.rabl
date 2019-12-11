child @entities, :object_root => false, :root => "items" do
  extends "api/task_suggestions/bit"
end

node(:pagination) do
  api_paginate @entities
end
