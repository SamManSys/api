FactoryBot.define do
  factory :stores_position do
    position_x { "1" }
    position_y { "A" }

    association :stores_container
  end
end