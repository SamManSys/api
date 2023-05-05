FactoryBot.define do
  factory :consent_questionnaire_response do
    association :consent_questionnaire_question
    association :completed_consent_questionnaire

    answer { "Answer" }
  end
end