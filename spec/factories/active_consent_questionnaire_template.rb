FactoryBot.define do
  factory :active_questionnaires_template do
    association :collection_protocol
    association :questionnaires_template
  end
end