MintScript::Application.routes.draw do
  resources :scripts do
    member do
      put :save
    end
  end
  
  devise_for :users

  root to: 'static_pages#home'
  match '/try' => 'scripts#try', via: [:get]
end
