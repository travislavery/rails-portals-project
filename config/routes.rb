Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users, only: [:show, :update]
  resources :portals
  resources :quests
  resources :portals, only: [:show] do
  	resources :quests
  end

  namespace :god do
  	resources :users
  end
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
