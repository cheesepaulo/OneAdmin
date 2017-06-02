Rails.application.routes.draw do

    root 'home#index'

    # Home
    get '/', to: 'home#index'

    # Departments
    resources :departments, except: :show

    # Users
    resources :users, except: :show

    # Devise
    devise_for :users, :skip => [:registrations]
  end
