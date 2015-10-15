Rails.application.routes.draw do
  root :to => 'stories#index'
  get '/stories/images', to: 'stories#images'

  resources :stories do
    resources :contributions
  end
end
