# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  # Helpers for basic auth
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  included do
    before_action :authenticate!

    def current_api_user
      return @current_api_user if defined?(@current_api_user)

      @current_api_user = authenticate_or_request_with_http_basic do |email, password|
        user = User.find_by(email: email)

        raise ApplicationError::Unauthorized if user.blank?

        raise ApplicationError::Unauthorized unless BCrypt::Password.new(user&.password_digest) == password

        user
      end
    end

    def current_user
      @current_api_user
    end
  end

  private

  def authenticate!
    current_api_user && nil
  end
end
