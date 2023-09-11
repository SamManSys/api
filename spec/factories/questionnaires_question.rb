FactoryBot.define do
  factory :questionnaires_question do
    association :questionnaires_template

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