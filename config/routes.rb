Rails.application.routes.draw do
  root to: 'offers#index' #index all offers, params[user_id] == nil

  devise_for :users do
    resources :consultations, only: %i[index destroy] #show all consultations of a logged in patient; deletes consultation
    resources :offers, only: %i[index] #all offers by a given doctor, if params[:user_id] exists
  end

  namespace :doctor do
    resources :offers, only: %i[index new create destroy] #logged in doctor's possible action
    resources :consultations, only: %i[index update destroy] #logged in doctor's possible action, update only for confirming with just one click
  end

  resources :offers, only: %i[] do #no routes for this
    resources :consultations, only: %i[create] #patient can create a new consultation clicking on an offer
  end

  resources :specialty, only: %i[show] #for showing all doctors from a given specialties
end

  # get '/doctor/my_appointments', to: 'users/consultations#index' >> doctor/consultations#index

  # delete '/doctor/my-appoinments/:id/', to: 'users/consultations#destroy' >> doctor/consultations#destroy

  # get '/doctor/my-appointments/new_appointments', to: 'users/consultations#new_appointment' >> consultations#create

  # patch '/doctor/my-appointments/:ID/confirm', to: 'users/consultations#confirm' >>  doctor/consultations#update

  # get '/cadedoutor/doctor/offers/', to: 'cadedoutor/doctor/offers/' >> doctor/offers#index

  # get '/cadedoutor/doctor/offers/new', to: 'cadedoutor/doctor/offers/new' >> doctor/offers#new

  # post '/cadedoutor/doctor/offers/', to: 'users/offers#create' >> doctor/offers#create

  # get '/ cadedoutor/patient/my-appointments', to: 'users/consultations#future' >> user/consultations#index

  # get '/ cadedoutor/patient/my-appointments', to: 'users/consultations#past' # era para mostrar as consultas passadas, mas desistimos para diminuir complexidade dadas as circuntâncias; agora, só lista todas as consultas em ordem e podemos usar uma classe css para deixar passadas mais cinzinhas

  # get '/cadedoutor/:speciality', to: 'doctor#speciality' >> specialty#show
  # get '/cadedoutor/:ID_Doctor/offers', to: '/:ID_Doctor/offers' >> :user_id/offers#index
  # post '', to: 'consultation#create' >> offers/consultations#create
  # get '/cadedoutor/:ID_Doctor/offer/:ID', to: 'consultation#new' >> offers/consultations#create
