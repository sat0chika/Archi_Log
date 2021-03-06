Rails.application.routes.draw do
  root to: 'main#index'
  devise_for :people
  devise_scope :person do
    post '/guest', to: 'guest_sessions#new_guest'
  end

  resources :topics do
    resource :likes, only: %i[create destroy]
    collection do
      get 'list_1'
      get 'list_2'
      get 'list_3'
      get 'list_4'
      get 'list_5'
      get 'list_6'
      get 'list_7'
      get 'index_1'
      get 'search'
    end
  end

  resources :people, only: %i[show edit update] do
    collection do
      get 'fab'
    end
  end

  resources :writers do
    collection do
      get 'show'
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
