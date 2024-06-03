Rails.application.routes.draw do
  devise_for :users
  root "static_pages#top"
  get "/term", to: "static_pages#term"
  get "/privacy", to: "static_pages#privacy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :prefecture_minimum_wages

  resources :impulse_purchases do
    resources :operation_plans
  end
end
