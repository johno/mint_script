MintScript::Application.routes.draw do
  resources :scripts do
    member do
      put :save
      put :private
    end
  end

  resources :images
  
  devise_for :users
  resources :users, only: [:show] do
    member do
      get :following, action: :followed
      get :followers
    end
  end

  root to: 'static_pages#home'
  match '/try' => 'scripts#try', via: [:get]
end
