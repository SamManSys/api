FactoryBot.define do
  factory :patient do
    firstname { Faker::Name.first_name }
    surname { Faker::Name.last_name }
  end
end