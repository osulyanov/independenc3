Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :user_token, only: :create
      resources :verticals
      resources :categories
    end
  end
end
