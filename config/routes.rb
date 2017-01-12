Rails.application.routes.draw do
  namespace :v1 do
    resources :measurements, only: %i(create)
  end
end
