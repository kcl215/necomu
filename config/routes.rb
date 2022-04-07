Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # 会員側
  root to: "public/homes#top"
  get "customers/my_page" => "public/customers#show"



  scope module: :public do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :cats, only: [:show, :new, :create, :edit, :update]
    resources :customers, only: [:edit, :update]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  # namespace :public do
  #   get 'customers/show'
  #   get 'customers/edit'
  # end
  # namespace :public do
  #   get 'homes/top'
  # end
  # namespace :admin do
  #   get 'customers/index'
  #   get 'customers/show'
  #   get 'customers/edit'
  # end
  # namespace :public do
  #   get 'posts/index'
  #   get 'posts/show'
  #   get 'posts/new'
  # end
  # namespace :public do
  #   get 'cats/show'
  #   get 'cats/new'
  #   get 'cats/edit'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
