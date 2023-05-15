Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :active_consent_questionnaire_templates
    resources :consent_questionnaire_responses
    resources :completed_consent_questionnaires
    resources :consent_questionnaire_questions
    resources :consent_questionnaire_templates
    resources :storage_container_positions
    resources :storage_container_templates
    resources :storage_containers
    resources :patient_identifiers
    resources :patients
    resources :registration_to_cps
    resources :collection_protocols
    resources :shipment_specimens, only: [:create, :destroy]
    resources :shipments
    resources :specimen_collections
    resources :specimens
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
