Rails.application.routes.draw do
  get 'candidate_profiles/new'
  get 'candidate_profiles/create'
  get 'candidate_profiles/show'
  get 'candidate_profiles/edit'
  get 'candidate_profiles/update'
  get 'candidate_profiles/destroy'
  get 'candidate_profiles/index'
  devise_for :users
  root to: "pages#home"
  resources :candidate_profiles
  get "up" => "rails/health#show", as: :rails_health_check
end
