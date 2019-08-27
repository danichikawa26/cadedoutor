Rails.application.routes.draw do
  devise_for :views
  root to: 'doctors#index' #index all offers, params[user_id] == nil

  devise_for :users


  resources :users, only: %i[show]

  resources :doctors


  resources :consultations, only: %i[index destroy] #show all consultations of a logged in patient; deletes consultation

  resources :offers, only: %i[index show] do #all offers by a given doctor, if params[:user_id] exists
    resources :consultations, only: %i[create] #patient can create a new consultation clicking on an offer
  end

  namespace :doctor do
    resources :offers, only: %i[index new create show destroy] #logged in doctor's possible action
    resources :consultations, only: %i[index update destroy] #logged in doctor's possible action, update only for confirming with just one click
  end
end


=begin
                   Prefix Verb   URI Pattern                                                                              Controller#Action
                     root GET    /                                                                                        offers#index
         new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
             user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
     destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
        new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
       edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
            user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
                          PUT    /users/password(.:format)                                                                devise/passwords#update
                          POST   /users/password(.:format)                                                                devise/passwords#create
 cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
    new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
   edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
        user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
                          PUT    /users(.:format)                                                                         devise/registrations#update
                          DELETE /users(.:format)                                                                         devise/registrations#destroy
                          POST   /users(.:format)                                                                         devise/registrations#create
                     user GET    /users/:id(.:format)                                                                     users#show
                  doctors GET    /doctors(.:format)                                                                       doctors#index
                          POST   /doctors(.:format)                                                                       doctors#create
               new_doctor GET    /doctors/new(.:format)                                                                   doctors#new
              edit_doctor GET    /doctors/:id/edit(.:format)                                                              doctors#edit
                   doctor GET    /doctors/:id(.:format)                                                                   doctors#show
                          PATCH  /doctors/:id(.:format)                                                                   doctors#update
                          PUT    /doctors/:id(.:format)                                                                   doctors#update
                          DELETE /doctors/:id(.:format)                                                                   doctors#destroy
            consultations GET    /consultations(.:format)                                                                 consultations#index
             consultation DELETE /consultations/:id(.:format)                                                             consultations#destroy
      offer_consultations POST   /offers/:offer_id/consultations(.:format)                                                consultations#create
                   offers GET    /offers(.:format)                                                                        offers#index
                    offer GET    /offers/:id(.:format)                                                                    offers#show
            doctor_offers GET    /doctor/offers(.:format)                                                                 doctor/offers#index
                          POST   /doctor/offers(.:format)                                                                 doctor/offers#create
         new_doctor_offer GET    /doctor/offers/new(.:format)                                                             doctor/offers#new
             doctor_offer GET    /doctor/offers/:id(.:format)                                                             doctor/offers#show
                          DELETE /doctor/offers/:id(.:format)                                                             doctor/offers#destroy
     doctor_consultations GET    /doctor/consultations(.:format)                                                          doctor/consultations#index
      doctor_consultation PATCH  /doctor/consultations/:id(.:format)                                                      doctor/consultations#update
                          PUT    /doctor/consultations/:id(.:format)                                                      doctor/consultations#update
                          DELETE /doctor/consultations/:id(.:format)                                                      doctor/consultations#destroy
       rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

=end
