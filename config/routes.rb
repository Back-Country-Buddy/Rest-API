Rails.application.routes.draw do

  namespace :api do
    namespace :private do
      namespace :v1 do
        resources :user, only: [:show, :create, :destroy, :update] do
          resources :tour do
            resources :plan
         end
       end
      resources :tour, only: [:show, :create, :destroy, :update]
      resources :plan, only: [:show, :create, :destroy, :update]
      resources :tour_user, only: [:index, :create]
      end
    end
  end
end
