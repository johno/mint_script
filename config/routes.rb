MintScript::Application.routes.draw do
  resources :scripts
  devise_for :users

  root to: 'static_pages#home'
  match '/try' => 'static_pages#try', via: [:get]
end
