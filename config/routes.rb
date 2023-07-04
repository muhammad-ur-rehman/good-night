Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users do
        resources :sleep_records, only: [:index, :create, :update]
        resources :friendships, only: [:create]

        get 'following_sleep_records', to: 'users#following_sleep_records'
        post 'clock_in', to: 'sleep_records#clock_in'
        post 'clock_out', to: 'sleep_records#clock_out'
        delete 'friendships', to: 'friendships#destroy'
      end
    end
  end
end
