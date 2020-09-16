class Student::MyPageController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
  end
end
