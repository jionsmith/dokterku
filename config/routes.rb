Rails.application.routes.draw do

  root 'institutions#index'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :institutions do
    resources :employees, only: [:new, :create, :destroy]
    resources :suppliers, only: [:new, :create]
    resources :drugs, only: [:new, :create]
    resources :visit_notes, only: [:new, :create, :destroy]
  end

  resources :suppliers, only: [:index]
  resources :pharmacies, only: [:new, :create, :destroy]
  resources :laboratories, only: [:new, :create, :destroy]
  resources :medical_vendors, only: [:new, :create, :destroy]
  resources :radiologies, only: [:new, :create, :destroy]
  resources :clinics, only: [:new, :create, :destroy]
  resources :midwifes, only: [:new, :create, :destroy]
  resources :dentists, only: [:new, :create, :destroy]
  resources :drugs, only: [:destroy]

  get '/units/new' => 'units#new'

  scope 'users' do
      get '/relative' => 'relatives#search_relative'
    scope '/:id' do
      get '/set_photo' => 'users#set_photo'
      get '/set_profile_details' => 'users#set_profile_details'
      get '/set_medical_histories' => 'users#set_medical_histories'
      get '/set_relatives' => 'users#set_relatives'

      put '/set_profile_details' => 'users#update_profile_details'
      post '/relatives' => 'relatives#create'
      put '/sign_up_details' => 'users#sign_up_details'
      post '/upload_photo' => 'users#upload_photo'
      post '/add_allergies' => 'users#add_allergies'
    end
  end

  scope 'institutions' do
    scope ':institution_id' do
      scope 'visit_notes' do
        scope ':id' do
          get '/step_two' => 'visit_note_steps#step_two'
          get '/step_three' => 'visit_note_steps#step_three'
          get '/step_four' => 'visit_note_steps#step_four'
          get '/step_five' => 'visit_note_steps#step_five'
          get '/step_six' => 'visit_note_steps#step_six'

          post '/set_diagnosis' => 'visit_note_steps#set_diagnosis'
          post '/set_therapy' => 'visit_note_steps#set_therapy'
          post '/set_action' => 'visit_note_steps#set_action'
          post '/set_allergies' => 'visit_note_steps#set_allergies'
          post '/set_medical_treatment' => 'visit_note_steps#set_medical_treatment'
        end
      end
    end
  end

  scope 'hospitals' do
    scope ':id' do
      put '/inst_profile' => 'hospital_steps#add_inst_profile'
      put '/inst_details' => 'hospital_steps#add_inst_details'
      post '/beds' => 'hospital_beds#create'
      post '/departments' => 'departments#add_in_inst'
      post '/assign_supplier' => 'suppliers#assign'

      get '/step_two' => 'hospital_steps#step_two'
      get '/step_three' => 'hospital_steps#step_three'
      get '/step_four' => 'hospital_steps#step_four'

    end
  end


  resources :users
  resources :hospitals


end
