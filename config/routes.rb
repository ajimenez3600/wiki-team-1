Rails.application.routes.draw do
  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'welcome#index'

  get 'pages/:title/history', :to => 'pages#history'
  post 'revisions/:id/revert', :to => 'revisions#revert'

  resources :pages, param: :title
  resources :users
<<<<<<< HEAD
  resources :revisions, only: [:index, :show, :create, :destroy]
  resources :file_upload, only: [:index, :new, :create, :destroy]
=======
  resources :revisions, only: [:index, :show, :destroy]
>>>>>>> master
end
