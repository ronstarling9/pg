Rails.application.routes.draw do
  resources :guess_criteria
  resources :guess_confirmations
  root 'guess_criteria#new'
end
