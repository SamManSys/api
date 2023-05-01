FactoryBot.define do
  factory :patient_identifier do
    sequence(:identifier_type) { |n| "ID_TYPE:#{n}"}
    sequence(:identifier) { |n| "ID:#{n}"}

    association :patient
  end
end 