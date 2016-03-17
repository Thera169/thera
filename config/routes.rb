Rails.application.routes.draw do
  devise_for :users

  # delete '/users/sign_out' => 'devise/sessions#destroy'
  
  scope "/admin" do
    resources :users
  end
  
  resources :roles
  resources :messages
  resources :conversations

  authenticated :user do
    root :to => 'conversations#index', as: :authenticated_root
  end
  root :to => 'welcome#index'


end
