class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class Forbidden < StandardError; end
  class NotFound < StandardError; end

  if Rails.env.production?
    rescue_from Exception, with: :rescue_500
    rescue_from ActionController::RoutingError, with: :rescue_404
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
    rescue_from ActionController::ParameterMissing, with: :rescue_400
  end

  rescue_from Forbidden, with: :rescue_403
  rescue_from NotFound, with: :rescue_404

  private
  def current_member
    Member.find_by(id: session[:member_id]) if session[:member_id]
  end
  helper_method :current_member

  def login_required
    raise Forbidden unless current_member
  end

  def rescue_400(exception)
    render "errors/bad_request", status: 400, layout: "error", formats: [:html]
  end

  def rescue_403(exception)
    render "errors/forbidden", status: 403, layout: "error", formats: [:html]
  end

  def rescue_404(exception)
    render "errors/not_found", status: 404, layout: "error", formats: [:html]
  end

  def rescue_500(exception)
    render "errors/internal_server_error", status: 500,
      layout: "error", formats: [:html]
  end
end
