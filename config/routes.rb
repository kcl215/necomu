Rails.application.routes.draw do

  namespace :public do
    get 'chats/show'
  end
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  root to: "public/homes#top"
  get "search" => "public/searches#search"
  devise_scope :customer do
    # TIPS: ユーザー登録しっぱいのリダイレクトのエラーを防ぐ
    get '/customers', to: 'public/registrations#new'
  end
  scope module: :public do
    resources :chats, only: [:show, :create]
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    resources :cats, only: [:show, :new, :create, :edit, :update]

    resources :customers, only: [:show, :edit, :update] do
      member do
        get :favorites
      end
      resource :relationships, only: [:create, :destroy]
    	get 'followings' => 'relationships#followings', as: 'followings'
    	get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
