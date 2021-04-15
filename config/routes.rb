Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do
    resources :user
    resources :tour
    # resources :tour do
    #   resources :plan
    # end
   end
  end
end
