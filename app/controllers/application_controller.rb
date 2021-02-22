# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound,   with: :render404
  rescue_from ActionController::RoutingError, with: :render404
  rescue_from Exception,                      with: :render500
  before_action :authenticate_user!

  def render404
    render template: 'errors/error_404', status: :not_found, layout: 'application', content_type: 'text/html'
  end

  def render500
    render template: 'errors/error_500', status: :internal_server_error, layout: 'application',
           content_type: 'text/html'
  end
end
