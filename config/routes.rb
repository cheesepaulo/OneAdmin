Rails.application.routes.draw do

  root 'home#index'

  # Devise
  devise_for :users, :skip => [:registrations]

  # Home
  get '/', to: 'home#index'

  # Departments
  resources :departments, except: :show

  # Users
  resources :users, except: :show

end
