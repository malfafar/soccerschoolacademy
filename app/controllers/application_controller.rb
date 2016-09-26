class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_label_nrs
  before_action :set_season

  layout :layout_by_resource



  def devise_parameter_sanitizer
		if resource_class == Coach
			CoachParams.new(Coach, :coach, params)
    elsif resource_class == PlayerAuth
      PlayerAuthParams.new(PlayerAuth, :player_auth, params)
    elsif resource_class == GuardianAuth
      GuardianAuthParams.new(GuardianAuth, :guardian_auth, params)
    else
	    super # Use the default one
	  end
	end

  def layout_by_resource

    if devise_controller? && resource_name == :coach && controller_name != "sessions" && controller_name != "passwords"
      "admin"
    elsif devise_controller? && resource_name == :player_auth && (action_name == "edit" || action_name == "update")
      "admin"
    elsif devise_controller? && resource_name == :guardian_auth && (action_name == "edit" || action_name == "update")
      "admin"
    elsif devise_controller? && resource_name == :player_auth && action_name == "show"
       "admin"
    elsif devise_controller? && resource_name == :guardian_auth && action_name == "show"
      "admin"
    elsif devise_controller? && resource_name == :admin
      "admin"
    else
      "application"
    end
  end

  def set_label_nrs
    if coach_signed_in?
      @pending_photos_count = Photo.where(approved: false).count
    end
  end

  def set_season
    if session.has_key?(:current_season)
      @current_season = Season.find(session[:current_season])
    else
      @current_season = Season.last
    end
  end



end
