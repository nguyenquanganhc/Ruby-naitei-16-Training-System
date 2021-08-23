Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users, except: :new
    resources :courses
    resources :subjects
    resources :enrollments, only: %i(create destroy)
    resources :supervisions, only: %i(create destroy)
    resources :reports
  end
end
