Rails.application.routes.draw do
   namespace :v1 do 
    resources :users, only: [:index, :show, :update, :create, :destroy ]
    resources :projects, only: [:index, :show, :update, :create, :destroy]
    resources :investors, only: [:index, :show, :update, :create, :destroy]
  end
end
