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
  
  scope module: 'public' do
    resources :end_users
    resources :questions
  end
  
  namespace :admin do
    resources :questions
  end
  
end
