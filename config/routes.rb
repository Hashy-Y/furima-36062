Rails.application.routes.draw do

  devise_for :users
  root to: "items#index" 
  
  resources :items
  resources :buy_records, only:[:index]
end
