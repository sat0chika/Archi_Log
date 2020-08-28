Rails.application.routes.draw do
  devise_for :people
  root to: 'main#index'
    # root to: 'people#edit'


  resources :topics, only: [:show, :index, :new, :create, :edit]
  resources :people, only: [:show, :edit, :update]
end
