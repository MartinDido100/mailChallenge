Rails.application.routes.draw do
    namespace :api do
        post 'auth/signin', to: 'auth#signIn'
        post 'auth/signup', to: 'auth#signUp'
        resources :user, only: [:destroy] do
            collection do
                get 'me'
            end
        end
    end
end
