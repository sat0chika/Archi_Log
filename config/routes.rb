Rails.application.routes.draw do
  devise_for :people
  root to: 'main#index'
  post 'topics/edit' => 'topics#edit'

  resources :topics do
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

  resources :writers do
    collection do
      get 'show_1'
      get 'show_2'
      get 'show_3'
      get 'show_4'
      get 'show_5'
      get 'show_6'
    end
  end

  namespace :api do
    resources :messages, only: :index, defaults: { format: 'json' }
  end

end
