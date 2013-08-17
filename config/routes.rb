MintScript::Application.routes.draw do
  resources :scripts do
    member do
      put :save
    end
  end
  
  devise_for :users
  resources :users, only: [] do
    member do
      get :following, :followers
    end
  end

  root to: 'static_pages#home'
  match '/try' => 'scripts#try', via: [:get]
end
