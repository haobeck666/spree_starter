class ApplicationController < ActionController::Base
  before_action :set_csp_nonce

  private

  def set_csp_nonce
    request.content_security_policy_nonce_generator = -> { SecureRandom.base64(16) }
  end
end
