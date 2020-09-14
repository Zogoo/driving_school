class Operator::HomeController < ApplicationController
  before_action :doorkeeper_authorize!
end
