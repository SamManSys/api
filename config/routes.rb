Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :storage_container_positions
    resources :storage_container_templates
    resources :storage_containers
    resources :patient_identifiers
    resources :patients
    resources :registration_to_cps
    resources :collection_protocols
    resources :samples
    resources :shipment_specimens, only: [:create, :destroy]
    resources :shipments
    resources :specimen_collections
    resources :specimens
    
    scope path: 'questionnaires', module: 'questionnaires' do
      resources :templates
      resources :questions
      resources :responses
      resources :forms
    end
    mount VandalUi::Engine, at: '/vandal'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
