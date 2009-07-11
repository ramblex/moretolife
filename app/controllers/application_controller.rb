# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  helper_method [ :pages_list, :areas_list, :admin? ]

  protected
  
  def pages_list
    @pages = Page.all
  end

  def areas_list
    @areas = Area.all
  end

  def authorise
    unless admin?
      flash[:error] = 'Unauthorised access'
      redirect_to login_path
      false
    end
  end

  def admin?
    session[:password] == "m0retolif3"
  end
end
