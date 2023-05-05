FactoryBot.define do
  factory :completed_consent_questionnaire do
    association :registration_to_cp

    signed_date { Date.today }
    witness_name { Faker::Name.name }    
  end
end