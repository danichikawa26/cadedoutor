Rails.application.routes.draw do
  root to: 'offers#index' #index all offers, params[user_id] == nil

  devise_for :users

  resources :consultations, only: %i[index destroy] #show all consultations of a logged in patient; deletes consultation

  resources :offers, only: %i[index show] do #all offers by a given doctor, if params[:user_id] exists
    resources :consultations, only: %i[create] #patient can create a new consultation clicking on an offer
  end

  namespace :doctor do
    resources :offers, only: %i[index new create show destroy] #logged in doctor's possible action
    resources :consultations, only: %i[index update destroy] #logged in doctor's possible action, update only for confirming with just one click
  end
end
