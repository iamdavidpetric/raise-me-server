Rails.application.routes.draw do
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :charges, only: [:create] do
    end
    resources :projects, only: %i[index show update create destroy] do
      collection do
        get :my_projects
      end
    end
    resources :todays_project, only: %i[index show] do
      collection do
        get :quick_info
      end
    end
  end
end
