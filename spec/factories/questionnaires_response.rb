FactoryBot.define do
  factory :questionnaires_response do
    association :questionnaires_question
    association :questionnaires_form

    answer { "Answer" }
  end
end