Rails.application.routes.draw do
  root to: 'tests#new'
  get 'tests/new'
  get 'tests/run'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
