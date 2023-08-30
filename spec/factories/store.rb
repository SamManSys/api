FactoryBot.define do
  factory :store do
    sequence(:name) { |n| "Container: #{n}"}

    size_x { 1 }
    size_y { 1 }

    association :storage_container_template
  end
end