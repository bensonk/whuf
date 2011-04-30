class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user

  protected
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def logout
    @current_user = nil
    session[:user_id] = nil
  end

  def must_be_admin
    unless current_user and current_user.admin?
      if current_user
        flash[:error] = "You must be an admin to do that."
        redirect_to :controller => :home, :action => :index
      else
        session[:redirect_target] = request.fullpath
        redirect_to :controller => :sessions, :action => :twitter
      end
    end
  end
end
