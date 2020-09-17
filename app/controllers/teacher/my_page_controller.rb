class Teacher::MyPageController < ApiController
  before_action :doorkeeper_authorize!

  def index
  end
end
