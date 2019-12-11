FactoryBot.define do
  factory :project_task do
    name { FFaker::Book.title }
  end
end
