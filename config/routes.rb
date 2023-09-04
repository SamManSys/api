Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :patient_identifiers
    resources :patients
    resources :registration_to_cps
    resources :collection_protocols
    resources :samples
    resources :shipment_samples, only: [:create, :destroy]
    resources :shipments
    resources :sample_collections
  
    resources :questionnaires_templates
    resources :questionnaires_questions
    resources :questionnaires_responses
    resources :questionnaires_forms
  
    resources :stores_templates
    resources :stores_containers
    resources :stores_positions, only: [:index, :show, :update]
  
    mount VandalUi::Engine, at: '/vandal'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
