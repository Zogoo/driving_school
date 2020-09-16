class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || resource.teacher.present? ? '/teacher/my_page' : '/student/my_page'
  end
end
