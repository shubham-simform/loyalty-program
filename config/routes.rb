Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :transactions, only: %i[new create index]

  root 'transactions#index'
end
