Rails.application.routes.draw do
  root 'input#new'
  post 'results' => 'input#create'
  get 'search' => 'search#new'
  post 'search_results' => 'search#results'
  get 'search_results' => 'search#new'
end
