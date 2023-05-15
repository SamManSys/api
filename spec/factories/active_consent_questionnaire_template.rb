FactoryBot.define do
  factory :active_consent_questionnaire_template do
    association :collection_protocol
    association :consent_questionnaire_template
  end
end