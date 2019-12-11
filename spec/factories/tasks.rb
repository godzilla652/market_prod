FactoryBot.define do
  factory :task do
    project_task
    title { FFaker::Book.title }
  end
end
