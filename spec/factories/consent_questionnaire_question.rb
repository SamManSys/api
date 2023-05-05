FactoryBot.define do
  factory :consent_questionnaire_question do
    association :consent_questionnaire_template

    question { "The question"}
    position { 0 }
    status { :active }
    
    trait :question_1 do
      position { 1 }
    end

    trait :closed do
      status { :closed }
    end

    trait :disabled do
      status { :disabled }
    end
  end
end