class Teacher::BaseController < ApiController
  def current_teacher
    @current_teacher = current_resource_owner.teacher
  end
end
