FactoryBot.define do
  factory :questionnaires_form do
    association :registration_to_cp

    signed_date { Date.today }
    witness_name { Faker::Name.name }    
  end
end