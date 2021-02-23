# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # They are searched from right to left, from bottom to top, and up the hierarchy.
  rescue_from Exception,                      with: :render500
  rescue_from ActiveRecord::RecordNotFound,   with: :render404
  rescue_from ActionController::RoutingError, with: :render404
  before_action :authenticate_user!

  def render404
    render template: 'errors/404', status: :not_found, layout: 'application', content_type: 'text/html'
  end

  def render500
    render template: 'errors/500', status: :internal_server_error, layout: 'application',
           content_type: 'text/html'
  end
end
