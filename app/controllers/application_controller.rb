# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ApplicationError::Unauthorized, with: :respond_unauthorized

  skip_before_action :verify_authenticity_token

  def not_found
    render json: { error: 'not_found' }, status: :not_found
  end

  def respond_unauthorized
    render json: { error: 'unauthorized' }, status: :unauthorized
  end
end
