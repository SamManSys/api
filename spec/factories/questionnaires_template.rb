FactoryBot.define do
  factory :questionnaires_template do
    sequence(:name) { |n| "CQT:#{n}" }    
  end
end