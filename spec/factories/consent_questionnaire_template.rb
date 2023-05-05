FactoryBot.define do
  factory :consent_questionnaire_template do
    sequence(:name) { |n| "CQT:#{n}" }    
  end
end