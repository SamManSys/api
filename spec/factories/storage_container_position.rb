FactoryBot.define do
  factory :storage_container_position do
    position_x { "1" }
    position_y { "A" }

    association :storage_container
  end
end