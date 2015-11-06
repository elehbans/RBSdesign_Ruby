Rails.application.routes.draw do
  root 'input#new'
  post 'results' => 'input#create'
end
