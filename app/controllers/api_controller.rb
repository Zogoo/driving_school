class ApiController < ActionController::Base
  rescue_from ActionController::ParameterMissing, with: :missing_params
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  include CommonErrorHelper

  before_action :doorkeeper_authorize!

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
