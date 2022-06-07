Rails.application.routes.draw do
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  root to: "public/homes#top"
  get 'about' => "public/homes#about"
  get 'search' => "public/seaches#search"
  
  scope module: 'public' do
    resources :end_users
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
    end
    resources :questions do
     resource :bookmarks, only: [:create, :destroy]
     resources :answers, only: [:create, :destroy]
    end
  end
  
  namespace :admin do
    resources :questions
  end
  
end
