Rails.application.routes.draw do
  devise_for :users, :skip => :registrations
  # delete '/users/sign_out' => 'devise/sessions#destroy'
  
  scope "/admin" do
    resources :users
  end
  
  match "/users/new", :to => "welcome#new_survivor", :via => :post, as: :create_survivor 
  match "/users/:id/edit", :to => "users#edit_self", :via => :get, as: :edit_self
  resources :roles
  resources :messages
  resources :conversations
  
  resources :surveys do
    resources :attempts
  end 

  
  authenticated :user do
    root :to => 'conversations#index', as: :authenticated_root
  end
  root :to => 'welcome#index'


end
