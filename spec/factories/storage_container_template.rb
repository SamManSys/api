FactoryBot.define do
  factory :storage_container_template do
    sequence(:name) { |n| "Container: #{n}"}
    
    label_x { "X" }
    label_y { "Y" }
    size_x { 1 }
    size_y { 1 }
  end
end