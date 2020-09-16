class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    origin_request = stored_location_for(resource)
    byebug
    origin_request || (resource.teacher.present? ? '/teacher/my_page' : '/student/my_page')
  end
  
  private

  def store_user_location!
    # :user is the scope we are authenticating
    byebug
    store_location_for(:user, request.fullpath)
  end

  def storable_location?
    byebug
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end
end
