Rails.application.routes.draw do
    namespace :api do
        post 'auth/signin', to: 'auth#signIn'
        post 'auth/signup', to: 'auth#signUp'
        resources :user, only: [] do
            collection do
                get 'me', to: 'user#me'
                delete '', to: 'user#destroy'
                put '', to: 'user#update'
                put 'confirm', to: 'user#confirm'
            end
        end
    end
end
