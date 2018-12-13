Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'welcome#index'

  get 'pages/:title/history', :to => 'pages#history'
  post 'pages/:title/lock', :to => 'pages#lock'
  post 'pages/:title/unlock', :to => 'pages#unlock'
  post 'revisions/:id/revert', :to => 'revisions#revert'

  devise_for :users

  
  resources :pages, param: :title
  resources :users, only: [:index, :show]
  resources :blacklists, only: [:index, :create, :destroy]
  resources :revisions, only: [:index, :show, :destroy]
end
