unless @entities.count.eql?(0)
  child @entities, :object_root => false, :root => "items" do
    #extends "api/tasks/single_task"
    node(false){|task| partial("api/tasks/single_task", :object => task)}
  end
else
  node('items'){[]}
end