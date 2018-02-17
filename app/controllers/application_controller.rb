class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :deny_access

  private

  def deny_access
  	redirect_to root_path, alert: "You don't have access to do that!"
  end
end
