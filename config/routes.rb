Rails.application.routes.draw do  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'pages#index'

  get 'pages/:title/history', :to => 'pages#history'

  resources :pages, param: :title
  resources :users
  resources :revisions, only: [:index, :show, :create, :destroy]
end
