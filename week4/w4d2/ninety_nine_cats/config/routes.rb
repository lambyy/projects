Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cats
  resources :cat_rental_requests, only: [:new, :create]

  patch 'cat_rental_requests/:id', to: 'cat_rental_requests#approve'
  patch 'cat_rental_requests/:id', to: 'cat_rental_requests#deny'

end
