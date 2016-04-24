Rails.application.routes.draw do
 devise_for :users, :controllers => { registrations: 'registrations', sessions: "users/sessions"}
 # devise_for :users, controllers: { sessions: "users/sessions" }

  authenticated :user do
    root :to => 'conversations#index', as: :authenticated_root
  end

  scope "/admin" do
    resources :users
  end

  unauthenticated :user do
    devise_scope :user do
      get "/login" => "devise/sessions#new"
      get "/" => "welcome#index"
    end
  end

  post 'playing' => 'conversations#new'
  # get 'admin_page' => 'users#index'

  resources :conversations do
    resources :messages
    resources :surveys
  end

end
