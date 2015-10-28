Rails.application.routes.draw do
  root 'input#new'
  resources :inputs
end
