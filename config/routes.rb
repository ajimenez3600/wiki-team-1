Rails.application.routes.draw do  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'pages#index'

  get 'pages/:title/history', :to => 'pages#history'

  resources :pages, param: :title, only: [:index, :show, :new, :edit]
  resources :users
  resources :revisions, only: [:index, :show, :create, :update, :destroy] # todo: remove update when I fix db
end
