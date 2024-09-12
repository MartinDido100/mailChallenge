Rails.application.routes.draw do
    namespace :api do
        post 'auth/signin', to: 'auth#signIn'
        post 'auth/signup', to: 'auth#signUp'
        resources :user, only: [] do
            collection do
                get 'me', to: 'user#me'
                delete '', to: 'user#destroy'
                put '', to: 'user#update'
                get 'confirm/:token', to: 'user#confirm'
            end
        end
        resources :mail, only: [] do
          collection do
            post '', to: 'email#sendMail'
            get 'stats', to: 'email#stats'
          end
        end
    end
end
