Rails.application.routes.draw do
  root to: 'tests_controller#new'
  get 'tests_controller/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
