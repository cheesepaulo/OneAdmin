Rails.application.routes.draw do

  get 'printers/index'

  root 'home#index'

  # Devise
  devise_for :users, :skip => [:registrations]

  # Home
  get '/', to: 'home#index'

  # Departments
  resources :departments, except: :show

  # Printers
  resources :printers, except: :show

  # Users
  resources :users, except: :show

end
