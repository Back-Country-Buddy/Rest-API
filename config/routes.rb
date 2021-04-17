Rails.application.routes.draw do
  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]

  
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
      end
    end
  end
end
