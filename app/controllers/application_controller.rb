class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.teacher.present?
      '/teacher/my_page'
    else
      '/student/my_page'
    end
  end
end
