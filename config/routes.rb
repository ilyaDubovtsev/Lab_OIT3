Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  root "articles#index"

  get 'add_a_fake_user', to: 'activities#add_a_fake_user'

end
