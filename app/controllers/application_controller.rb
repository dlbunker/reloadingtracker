class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  # after_filter :set_csrf_cookie_for_ng

  respond_to :json

  private
  def ensure_admin!
    unless current_api_user.admin?
      head :no_content
    end
  end
end
