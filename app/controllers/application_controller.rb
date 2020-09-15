class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.teacher.present?
      redirect_to('/teacher/my_page')
    else
      redirect_to('/student/my_page')
    end
  end
end
