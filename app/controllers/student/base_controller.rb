class Student::BaseController < ApiController
  def current_student
    @current_student = current_resource_owner.student
  end
end
