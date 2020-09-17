ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module FileHelper
  def read_rest_data(name)
    File.read(Rails.root.to_s + "/tests/support/files/#{name}")
  end
end

module TokenTesHelper
  def create_token_for(user)
    Doorkeeper::AccessToken.create!(
      resource_owner_id: user.id,
      application_id: oauth_applications(:mobile_app).id,
      token: Doorkeeper::JWT.generate(application: oauth_applications(:mobile_app), resource_owner_id: user.id),
      scopes: oauth_applications(:mobile_app).scopes,
      created_at: Time.now,
      expires_in: 28800
    )
  end
end

class ActionDispatch::IntegrationTest
  include FileHelper
  include TokenTesHelper
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  set_fixture_class oauth_applications: Doorkeeper::Application

  # Add more helper methods to be used by all tests here...
end
