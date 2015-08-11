class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from RecordNotFound, with: -> { render status: 404, text: "four-oh-four" }

  helper_method :current_account
  def current_account
    Account.find(params[:slug] || "worksample")
  end
end
