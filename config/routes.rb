Rails.application.routes.draw do
  devise_for :people
  root to: 'main#index'
  post 'topics/edit' => 'topics#edit'

  resources :topics do
  # , only: [:show, :index, :new, :create, :edit, :update, :destroy]
    resource :likes, only: [:create, :destroy]
    collection do
      get 'list_1'
      get 'list_2'
      get 'list_3'
      get 'list_4'
      get 'list_5'
      get 'list_6'
      get 'list_7'
    end
  end
  
  resources :people, only: [:show, :edit, :update] do
    collection do
      get 'fab'
    end
  end

  namespace :api do
    resources :messages, only: :index, defaults: { format: 'json' }
  end

end
