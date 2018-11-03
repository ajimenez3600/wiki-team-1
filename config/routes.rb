Rails.application.routes.draw do
  get 'file_upload/index'
  get 'file_upload/new'
  get 'file_upload/create'
  get 'file_upload/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'welcome#index'

  get 'pages/:title/history', :to => 'pages#history'
  post 'revisions/:id/revert', :to => 'revisions#revert'

  resources :pages, param: :title
  resources :users
  resources :revisions, only: [:index, :show, :create, :destroy]
  resources :file_upload, only: [:index, :new, :create, :destroy]
    root "file_upload#index"
end
