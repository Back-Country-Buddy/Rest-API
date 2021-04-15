Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :user do
        resources :tour do
          resources :plan
        end
      end
      resources :tour
      resources :plan
    end
  end
end
