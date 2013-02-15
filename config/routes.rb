MintScript::Application.routes.draw do
  resources :scripts
  devise_for :users

  root to: 'static_pages#home'
  match '/try' => 'scripts#try', via: [:get]
end
