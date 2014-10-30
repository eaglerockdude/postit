PostitTemplate::Application.routes.draw do

  root to: 'posts#index'

  #comments nested within posts

  resources :posts, except: [:destroy] do

    member do
      post :vote
    end

      resources :comments, only: [:create] do
       member do
        post 'vote'
      end
      end

  end

  resources :categories, only:[:new, :show, :create]

  resources :users, only:[:show, :create, :edit, :update]    #register handles our "new"

  # routes for login/logout via session
  get "register" => "users#new"
  get  "login"   => "sessions#new"
  post "login"   => "sessions#create"
  get  "logout"  => "sessions#destroy"

end
