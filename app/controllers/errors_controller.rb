class ErrorsController < ApplicationController

  def error404
    activate_authlogic
    render :template => "/errors/404.html.erb", :status => 404
  end

  def error422
    activate_authlogic
    render :template => "/errors/422.html.erb", :status => 422
  end

  def error500
    activate_authlogic
    render :template => "/errors/500.html.erb", :status => 500
  end

end
