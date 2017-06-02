Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'home#index'

  # Departments
  resources :departments, except: :show
end
