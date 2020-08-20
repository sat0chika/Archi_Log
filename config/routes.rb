Rails.application.routes.draw do
  devise_for :people
  root to: 'main#index'
    # root to: 'people#edit'


  resources :topics, only: [:index]
  resources :people, only: [:show, :edit, :update]
end
