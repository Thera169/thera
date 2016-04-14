Rails.application.routes.draw do
 devise_for :users, :controllers => { registrations: 'registrations', sessions: "users/sessions"}
 # devise_for :users, controllers: { sessions: "users/sessions" }

  authenticated :user do
    root 'users#index'
  end

  unauthenticated :user do
    devise_scope :user do
      get "/login" => "devise/sessions#new"
      get "/" => "welcome#index"
    end
  end

  post 'playing' => 'conversations#new'
  
  resources :conversations do
    resources :messages
    resources :surveys
  end

end
