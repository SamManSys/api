FactoryBot.define do
  factory :registration_to_cp do
    date { Date.today }
    sequence(:registration_identifier) { |n| "RegId:#{n}" } 

    association :collection_protocol
  end
end