MintScript::Application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    member do
      get :following, action: :followed
      get :followers
    end
  end

  resources :scripts do
    member do
      put :save
      put :private
    end
  end

  resources :projects
  resources :images

  root to: 'static_pages#home'
  match '/try' => 'scripts#try', via: [:get]
end
