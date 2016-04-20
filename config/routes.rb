Rails.application.routes.draw do

  get 'people/index'

  resources :categories, :products, :people
  
  root 'products#index'
end
