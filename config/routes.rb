Rails.application.routes.draw do

  resources :slides
  resources :sponsors
  get 'styleguide' => 'styleguide#index' if Rails.env.development?
  get 'player_matches/confirm_call/:id/:m_id', to: "player_matches#confirm_call", as: "player_confirm_call"

  get 'player_matches/deny_call/:id/:m_id', to: "player_matches#deny_call", as: "player_deny_call"

  resources :documents
  resources :schools

  get 'player_team_seasons/index'
  get 'player_team_seasons/show'

  resources :posts
  resources :photos
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :coaches, :controllers => {:sessions => "coaches/sessions", :registrations => "coaches/registrations"}, skip: :registrations
  devise_scope :coach do
    resource :registration,
      only: [:edit, :update, :destroy],
      path: 'coaches',
      path_names: { new: 'sign_up' },
      controller: 'coaches/registrations',
      as: :coach_registration do
        get :cancel
    end
  end


  devise_for :player_auths,  :controllers => {:registrations => "player_auths/registrations", :confirmations => "player_auths/confirmations", :sessions => "player_auths/sessions"}, skip: :registrations
  devise_scope :player_auth do
    resource :registration,
      only: [:edit, :update, :create, :destroy, :show],
      path: 'player_auth',
      path_names: { new: 'sign_up' },
      controller: 'player_auths/registrations',
      as: :player_auth_registration do
        get :cancel
      end
  end
  as :player_auth do
      patch '/player_auths/confirmation' => 'player_auths/confirmations#update', :via => :patch, :as => :update_player_confirmation
  end


  devise_for :guardian_auths,  :controllers => {:registrations => "guardian_auths/registrations", :confirmations => "guardian_auths/confirmations", :sessions => "guardian_auths/sessions"}, skip: :registrations
  devise_scope :guardian_auth do
    resource :registration,
      only: [:edit, :update, :create, :destroy, :show],
      path: 'guardian_auth',
      path_names: { new: 'sign_up' },
      controller: 'guardian_auths/registrations',
      as: :guardian_auth_registration do
        get :cancel
      end
  end

  as :guardian_auth do
      patch '/guardian_auths/confirmation' => 'guardian_auths/confirmations#update', :via => :patch, :as => :update_guardian_confirmation
  end


  resources :statistics
  resources :matches
  resources :competitions
  # Descomentar para EuroLeague
  # resources :seasons
  resources :teams
  resources :exams
  resources :guardians
  # resources :players
  resources :guardian_team_seasons, only: [:index, :show, :update]
  resources :guardian_auth_matches, only: [:update]
  resources :player_team_seasons, only: [:index, :show, :update]

  get 'guardian_auth_matches/confirm_call/:id/:m_id', to: "guardian_auth_matches#confirm_call", as: "guardian_confirm_call"
  get 'guardian_auth_matches/deny_call/:id/:m_id', to: "guardian_auth_matches#deny_call", as: "guardian_deny_call"


  resources :team_seasons do
    collection do
      get ':id/attendance', to: 'team_seasons#attendance', as: 'attendance'
    end
  end


  resources :practices do
    collection do
      post 'update_player_practice/:id', to: 'practices#update_player_practice', as: 'update_player_practice'
      post 'add_pp_late_time/:id', to: 'practices#add_late_time', as: "add_pp_late_time"
    end
  end

  get 'attendance/show/:id', to: 'attendance#show', as: 'show_attendance'

  get 'guardian_auth_players/index', as: 'guardian_index_players'
  get 'guardian_edit_player/:id', to: 'guardian_auth_players#edit', as: 'guardian_edit_player'
  post 'guardian_update_player/:id', to: 'guardian_auth_players#update', as: 'guardian_update_player'
  patch 'guardian_update_player/:id', to: 'guardian_auth_players#update'
  get 'guardian_show_player/:id', to: 'guardian_auth_players#show', as: 'guardian_show_player'

  get 'coach_guardians/edit'
  get 'coach_guardians/new'

  get 'coach_players/new', as: 'coach_new_player'
  get 'coach_players/index', to: 'coach_players#index', as: 'coach_index_players'
  get 'coach_show_player/:id', to: 'coach_players#show', as: 'coach_show_player'
  get 'coach_edit_player/:id', to: 'coach_players#edit', as: 'coach_edit_player'
  post 'coach_update_player/:id', to: 'coach_players#update', as: 'coach_update_player'
  patch 'coach_update_player/:id', to: 'coach_players#update'
  post 'coach_create_player', to: 'coach_players#create', as: 'coach_create_player'
  post 'coach_add_player_medical/:id', to: 'coach_players#add_medical', as: 'coach_add_medical'

  get 'coach_approved_photos/', to: 'photos#index_approved', as: 'index_approved'
  get 'coach_pending_photos/', to: 'photos#index_pending', as: 'index_pending'

  get 'general_pages/index', to: 'general_pages#index', as: 'general_index'
  get 'general_pages/contact', to: 'general_pages#contact', as: 'contact'
  post 'general_pages/send_contact', to: 'general_pages#send_contact', as: 'send_contact'
  get 'general_pages/about', to: 'general_pages#index', as: 'about'
  get 'general_pages/all_teams', to: 'general_pages#teams', as: 'all_teams'
  get 'general_pages/players/:id', to: 'general_pages#players', as: 'team_players'
  get 'general_pages/player/:id/:p_id', to: 'general_pages#player', as: 'gp_player'
  get 'general_pages/rankings/(:id/:c_id)', to: 'general_pages#rankings', as: 'ranking'
  get 'general_pages/calendar/:id/(:c_id)', to: 'general_pages#calendar', as: 'calendar'
  # get 'general_pages/competitions/(:id)', to: 'general_pages#competitions', as: 'all_competitions'
  # get 'general_pages/competition/:id/:c_id', to: 'general_pages#competition', as: 'show_competition'
  get 'general_pages/gallery/(team_season/:id)(/level/:level)', to: 'general_pages#photo_gallery', as: 'gallery'
  get 'general_pages/posts/(team_season/:id)(/level/:level)', to: 'general_pages#posts', as: 'all_posts'
  get 'general_pages/posts/:post_id(/team_season/:id)', to: 'general_pages#post', as: 'show_post'
  get 'general_pages/match/:m_id/team_season/:id', to: 'general_pages#match', as: 'show_match'

  post 'general_pages/change_season', to: 'general_pages#change_season', as: 'change_season'

  get 'list_documents', to: 'documents#show_documents', as: "list_documents"

  post 'add_stat_late_time/:id', to: 'statistics#add_late_time', as: "add_stat_late_time"

  get 'filter_team_seasons/:id', to: 'competitions#filter_team_seasons', as: 'filter_team_seasons'

  get 'get_team_level/:id', to: 'team_seasons#get_team_level', as: 'get_team_level'

  root 'general_pages#index'
end
