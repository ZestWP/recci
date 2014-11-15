Rails.application.routes.draw do



  resources :levels

  resources :categories

  resources :sources

  resources :statuses

  resources :interesteds

  resources :leads

  resources :tasks

  resources :customers

  resources :users
  
  resources :sessions
	
get "change_password/new"
get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
#get "sign_up" => "users#new", :as => "sign_up"
root :to => "sessions#show"



end
