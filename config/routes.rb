Rails.application.routes.draw do
  resources :users do
    resources :sleep_records, only: [:index]
    resources :friendships, only: [:create, :destroy]
    get 'following_sleep_records', to: 'users#following_sleep_records'
    post 'clock_in', to: 'sleep_records#clock_in'
    post 'clock_out', to: 'sleep_records#clock_out'
  end
  post 'signup', to: 'users#create'
end
