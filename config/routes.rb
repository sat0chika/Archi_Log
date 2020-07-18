Rails.application.routes.draw do
  devise_for :people
  root to: 'main#index'
    # root to: 'people#edit'


  resources :details, only: [:index]
  resources :people, only: [:edit, :update]
end
