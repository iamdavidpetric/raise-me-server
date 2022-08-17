Rails.application.routes.draw do
  namespace :v1 do 
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :investors, only: [:index, :show, :update, :create, :destroy]
    resources :sessions, only: [:create, :destroy]
    resources :projects, only: [:index, :show, :update, :create, :destroy] do  
      collection do
        get :my_projects
      end
    end 
    resources :users, only: [:index, :show, :update, :create, :destroy]
    resources :todays_project, only: [:index, :show] do 
      collection do
        get :quick_info
      end
    end
  end
end
