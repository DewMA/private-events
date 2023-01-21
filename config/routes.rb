Rails.application.routes.draw do

  get "user/:id/invites", to: "invites#index", as: :user_invites
  post "events/:event_id/invites/:id", to: "invites#create", as: :invite_user
  delete "events/:event_id/invites/:id/delete", to: "invites#destroy", as: :delete_invite
  post "events/:event_id/accept_invite/:id", to: "invites#accept", as: :accept_invite
  delete "attendees/:event_id/delete/:id", to: "attendees#destroy", as: :delete_attendee
  get "events/upcoming", to: "events#upcoming", as: :upcoming_events
  get "events/past", to: "events#past", as: :past_events

  resources :users, only: [ :show, :index ]

  resources :attendees, except: [ :destroy ]
  root "events#index"

  resources :events do
    resources :invites, except: [ :create, :destroy ]
  end
  
  devise_for :users, controllers: {
    registrations: "custom_controllers/registrations",
    sessions: "custom_controllers/sessions"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
