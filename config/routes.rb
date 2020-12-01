Rails.application.routes.draw do
  resources :keys
  devise_for :users, skip: [:registrations]

  root 'keys#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
