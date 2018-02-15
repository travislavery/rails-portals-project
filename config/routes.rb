Rails.application.routes.draw do
  resources :users
  resources :portals
  resources :quests
  resources :portals, only: [:show] do
  	resources :quests
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
