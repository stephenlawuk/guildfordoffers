class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :timer

  #override ip on localhost method else get real ip
  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      # mine which is useless as it appears in manchester
      #'2.125.147.111'
      # surrey uni ip
      #'131.227.76.231'
      '131.227.132.6'
      #'131.227.132.17'
      #France IP
      #'141.227.132.17'
      #Random guildford IP maps to london
      # '195.194.86.82'
      #'94.136.40.103'
    else
      request.remote_ip
    end
  end

  def timer
    @start_time = Time.now
  end

  unless config.consider_all_requests_local
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
    rescue_from ActionController::UnknownController, :with => :render_not_found
    rescue_from ActionController::UnknownAction, :with => :render_not_found
  end

  helper_method :current_user_session, :current_user

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to root_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
	end

	def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
	end

  # log error doesnt appear to be working or it maybe auto
  # not sure which formats rails 3 uses might be _ or .
  def render_not_found(exception)
    @exception = exception
    activate_authlogic
    render :template => "/errors/404.html.erb", :status => 404
    #log_error(exception)
    #log.error(exception)
  end
  
  def render_error(exception)
    @exception = exception
    activate_authlogic
    render :template => "/errors/500.html.erb", :status => 500
    #log_error(exception)
    #log.error(exception)
  end

# Not working in rails 3 until rails developers fixes it
#protected
#  def render_optional_error_file(status_code)
#    status = interpret_status(status_code)
#    render :template => "errors/#{status[0,3]}.html.erb", :status => status, :layout => 'application.html.erb'
#  end

end
